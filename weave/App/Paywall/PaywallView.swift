import StoreKit
import SwiftUI

struct PaywallView: View {
  @Environment(AppEnvironment.self) private var environment
  @Environment(\.locale) private var locale
  @State private var isShowingSubscriptionManagement = false

  var body: some View {
    NavigationStack {
      ScrollView {
        VStack(spacing: 18) {
          Image(
            systemName: environment.isPremium
              ? "checkmark.seal.fill"
              : environment.product.symbolName
          )
          .font(.system(size: 48))
          .foregroundStyle(environment.product.accent)
          .accessibilityHidden(true)

          Text(
            environment.isPremium
              ? "\(environment.product.name) Pro is active" : "\(environment.product.name) Pro"
          )
          .font(.title.bold())

          Text(environment.product.tagline)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)

          if !environment.isAIAvailable {
            CardView {
              Label(
                "The on-device assistant is currently unavailable. Pro requires a supported device and language, Apple Intelligence enabled, and the model downloaded. Purchasing a plan does not enable Apple Intelligence.",
                systemImage: "exclamationmark.triangle"
              )
              .foregroundStyle(.secondary)
            }
          }

          Group {
            StoreView(
              ids: ProductID.offeredProductIDs(
                dailyPassIsActive: environment.isProductActive(
                  WeaveCommerceCatalog.dailyPassProductID
                )
              )
            )
            .storeButton(.hidden, for: .cancellation)
            .storeButton(.hidden, for: .restorePurchases)

            if let expirationDate = environment.entitlements.expirationDates[
              WeaveCommerceCatalog.dailyPassProductID
            ], environment.isProductActive(WeaveCommerceCatalog.dailyPassProductID) {
              Text(
                "7-Day Pass active until \(expirationDate.formatted(date: .abbreviated, time: .shortened))"
              )
              .font(.footnote.bold())
              .foregroundStyle(environment.product.accent)
            }
          }

          RestorePurchasesButton()

          Button("Check Assistant Availability") {
            Task { await environment.refreshAIAvailability() }
          }

          Button("Manage Subscription") {
            isShowingSubscriptionManagement = true
          }

          HStack(spacing: 16) {
            Link(
              "Privacy Policy",
              destination: environment.product.localizedLegalURL(
                environment.product.privacyPolicyURL,
                for: locale
              )
            )
            Link(
              "Terms of Use",
              destination: environment.product.localizedLegalURL(
                environment.product.termsOfUseURL,
                for: locale
              )
            )
          }
          .font(.footnote)

        }
        .padding(24)
      }
      .task { await environment.refreshAIAvailability() }
      .navigationTitle("Pro")
      .manageSubscriptionsSheet(isPresented: $isShowingSubscriptionManagement)
    }
  }

}
