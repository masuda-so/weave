import Foundation
import SwiftData
import XCTest

@testable import weave

final class WeaveFoundationTests: XCTestCase {
  @MainActor
  func testProductIdentityMatchesBundleConvention() {
    let product = ProductDefinition.weave

    XCTAssertEqual(product.identifier, "weave")
    XCTAssertEqual(product.bundleIdentifier, "llc.ether.\(product.identifier)")
    XCTAssertEqual(
      WeaveCommerceCatalog.dailyPassProductID,
      "\(product.bundleIdentifier).pro.daily"
    )
    XCTAssertEqual(
      WeaveCommerceCatalog.monthlyProductID,
      "\(product.bundleIdentifier).pro.monthly"
    )
    XCTAssertEqual(
      WeaveCommerceCatalog.yearlyProductID,
      "\(product.bundleIdentifier).pro.yearly"
    )
    XCTAssertEqual(
      WeaveCommerceCatalog.catalog.nonRenewingDurations[WeaveCommerceCatalog.dailyPassProductID],
      24 * 60 * 60
    )
    XCTAssertEqual(product.name, "Weave")
    XCTAssertFalse(product.tagline.isEmpty)
    XCTAssertEqual(
      product.privacyPolicyURL.absoluteString,
      "https://ether-llc.com/apps/weave/privacy/"
    )
    XCTAssertEqual(
      product.termsOfUseURL.absoluteString,
      "https://ether-llc.com/apps/weave/terms/"
    )
  }

  @MainActor
  func testApplicationSectionsRemainDistinct() {
    let sections: Set<AppSection> = [.drafts, .assistant, .pro, .settings]

    XCTAssertEqual(sections.count, 4)
  }

  @MainActor
  func testLegalURLsMatchPublishedRoutesAndLocale() {
    let product = ProductDefinition.weave
    let base = "https://ether-llc.com/apps/\(product.identifier)"
    let urls = [
      (product.privacyPolicyURL, "privacy"),
      (product.termsOfUseURL, "terms"),
      (product.supportURL, "support"),
    ]

    for (url, route) in urls {
      XCTAssertEqual(url.absoluteString, "\(base)/\(route)/")
      XCTAssertEqual(
        product.localizedLegalURL(url, for: Locale(identifier: "en_US")),
        url
      )

      let japaneseURL = product.localizedLegalURL(
        url,
        for: Locale(identifier: "ja_JP")
      )
      XCTAssertEqual(
        japaneseURL.absoluteString,
        "https://ether-llc.com/ja/apps/\(product.identifier)/\(route)/"
      )
      XCTAssertEqual(
        product.localizedLegalURL(japaneseURL, for: Locale(identifier: "ja_JP")),
        japaneseURL
      )
    }
  }

  @MainActor
  func testDailyPassControlsProAccessAtExpiration() {
    let expiration = Date(timeIntervalSince1970: 100_000)
    let entitlements = EntitlementSnapshot(
      activeProductIDs: [WeaveCommerceCatalog.dailyPassProductID],
      expirationDates: [WeaveCommerceCatalog.dailyPassProductID: expiration]
    )

    XCTAssertTrue(
      entitlements.hasPremiumAccess(
        in: WeaveCommerceCatalog.catalog,
        at: expiration.addingTimeInterval(-1)
      )
    )
    XCTAssertFalse(
      entitlements.hasPremiumAccess(in: WeaveCommerceCatalog.catalog, at: expiration)
    )
  }

  @MainActor
  func testAppEnvironmentUsesInjectedDateForDailyPassAccess() {
    let expiration = Date(timeIntervalSince1970: 100_000)
    let entitlements = EntitlementSnapshot(
      activeProductIDs: [WeaveCommerceCatalog.dailyPassProductID],
      expirationDates: [WeaveCommerceCatalog.dailyPassProductID: expiration]
    )
    let environmentBeforeExpiration = AppEnvironment(
      aiClient: UnavailableAIClient(reason: .modelNotReady),
      subscriptionClient: PreviewSubscriptionClient(),
      currentDate: { expiration.addingTimeInterval(-1) }
    )
    environmentBeforeExpiration.entitlements = entitlements
    XCTAssertTrue(environmentBeforeExpiration.isPremium)
    XCTAssertTrue(
      environmentBeforeExpiration.isProductActive(WeaveCommerceCatalog.dailyPassProductID)
    )

    let environmentAtExpiration = AppEnvironment(
      aiClient: UnavailableAIClient(reason: .modelNotReady),
      subscriptionClient: PreviewSubscriptionClient(),
      currentDate: { expiration }
    )
    environmentAtExpiration.entitlements = entitlements
    XCTAssertFalse(environmentAtExpiration.isPremium)
    XCTAssertFalse(
      environmentAtExpiration.isProductActive(WeaveCommerceCatalog.dailyPassProductID)
    )
  }

  func testExpirationDelayUsesInjectedCurrentDate() {
    let currentDate = Date(timeIntervalSince1970: 1_000)

    XCTAssertEqual(
      AppEnvironment.expirationDelay(
        until: currentDate.addingTimeInterval(60),
        from: currentDate
      ),
      .seconds(60)
    )
    XCTAssertEqual(
      AppEnvironment.expirationDelay(
        until: currentDate.addingTimeInterval(-1),
        from: currentDate
      ),
      .zero
    )
  }

  @MainActor
  func testInMemoryDataContainerStartsWithoutPreviewRecords() throws {
    let dataContainer = DataContainer(isStoredInMemoryOnly: true)

    XCTAssertTrue(try dataContainer.context.fetch(FetchDescriptor<Draft>()).isEmpty)
  }

  @MainActor
  func testDataContainerCreatesEditsAndDeletesDraft() throws {
    let dataContainer = DataContainer(isStoredInMemoryOnly: true)
    let draft = Draft(title: "Message", text: "First")

    dataContainer.context.insert(draft)
    try dataContainer.context.save()
    let saved = try XCTUnwrap(
      dataContainer.context.fetch(FetchDescriptor<Draft>()).first
    )
    saved.text = "Revised"
    try dataContainer.context.save()
    XCTAssertEqual(
      try dataContainer.context.fetch(FetchDescriptor<Draft>()).first?.text,
      "Revised"
    )

    dataContainer.context.delete(saved)
    try dataContainer.context.save()
    XCTAssertTrue(try dataContainer.context.fetch(FetchDescriptor<Draft>()).isEmpty)
  }

  @MainActor
  func testFailedTransactionDiscardsPendingDraft() throws {
    let dataContainer = DataContainer(isStoredInMemoryOnly: true)

    XCTAssertThrowsError(
      try dataContainer.context.performTransactionOrRollback {
        dataContainer.context.insert(Draft(title: "Unsaved", text: ""))
        throw CocoaError(.fileWriteNoPermission)
      }
    )

    XCTAssertTrue(try dataContainer.context.fetch(FetchDescriptor<Draft>()).isEmpty)
  }

  @MainActor
  func testFailedEditRestoresPersistedDraft() throws {
    let dataContainer = DataContainer(isStoredInMemoryOnly: true)
    let draft = Draft(title: "Saved", text: "Original")
    dataContainer.context.insert(draft)
    try dataContainer.context.save()

    XCTAssertThrowsError(
      try dataContainer.context.performTransactionOrRollback {
        draft.text = "Unsaved change"
        throw CocoaError(.fileWriteNoPermission)
      }
    )

    let saved = try XCTUnwrap(
      dataContainer.context.fetch(FetchDescriptor<Draft>()).first
    )
    XCTAssertEqual(saved.text, "Original")
  }

  @MainActor
  func testFailedDeleteRestoresPersistedDraft() throws {
    let dataContainer = DataContainer(isStoredInMemoryOnly: true)
    let draft = Draft(title: "Saved", text: "Original")
    dataContainer.context.insert(draft)
    try dataContainer.context.save()

    XCTAssertThrowsError(
      try dataContainer.context.performTransactionOrRollback {
        dataContainer.context.delete(draft)
        throw CocoaError(.fileWriteNoPermission)
      }
    )

    XCTAssertEqual(try dataContainer.context.fetch(FetchDescriptor<Draft>()).count, 1)
  }

  func testTransactionFailureTriggersRollback() {
    var didRollback = false

    XCTAssertThrowsError(
      try ModelContext.performTransactionOrRollback(
        transaction: { throw CocoaError(.fileWriteNoPermission) },
        rollback: { didRollback = true }
      )
    )
    XCTAssertTrue(didRollback)
  }
}
