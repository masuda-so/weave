import SwiftUI

/// Stable identifiers that must remain compatible with App Store records.
enum ProductIdentity {
  nonisolated static let identifier = "weave"
  nonisolated static let bundleIdentifier = "llc.ether.\(identifier)"
}

/// Product-specific presentation, assistant, and legal configuration.
struct ProductDefinition {
  let identifier: String
  let bundleIdentifier: String
  let name: String
  let tagline: String
  let symbolName: String
  let accent: Color
  let assistantInputTitle: String
  let assistantActionTitle: String
  let assistantProgressTitle: String
  let assistantTitle: String
  let assistantOutputTitle: String
  let assistantInstructions: String
  let assistantPromptPrefix: String
  let settingsPrivacySummary: String
  let privacyPolicyURL: URL
  let termsOfUseURL: URL
  let supportURL: URL

  static let weave = ProductDefinition(
    identifier: ProductIdentity.identifier,
    bundleIdentifier: ProductIdentity.bundleIdentifier,
    name: "Weave",
    tagline: String(localized: "Shape words that still feel like you."),
    symbolName: "bubble.left.and.bubble.right.fill",
    accent: .indigo,
    assistantInputTitle: String(localized: "A draft you want to refine"),
    assistantActionTitle: String(localized: "Refine"),
    assistantProgressTitle: String(localized: "Refining your draft…"),
    assistantTitle: String(localized: "Composer"),
    assistantOutputTitle: String(localized: "Refined draft"),
    assistantInstructions:
      "Help edit the user's own message while preserving meaning. Do not assist threats, harassment, fraud, or impersonation. Never claim to send a message or speak on the user's behalf.",
    assistantPromptPrefix:
      "Improve clarity and tone while preserving the original intent of this draft:",
    settingsPrivacySummary: String(
      localized: "Your drafts stay on this device."
    ),
    privacyPolicyURL: validatedURL(
      "https://ether-llc.com/apps/weave/privacy/"
    ),
    termsOfUseURL: validatedURL(
      "https://ether-llc.com/apps/weave/terms/"
    ),
    supportURL: validatedURL(
      "https://ether-llc.com/apps/weave/support/"
    )
  )

  func localizedLegalURL(_ url: URL, for locale: Locale) -> URL {
    guard
      locale.language.languageCode?.identifier == "ja",
      url.host == "ether-llc.com",
      !url.path.hasPrefix("/ja/")
    else {
      return url
    }

    guard var components = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
      return url
    }
    components.percentEncodedPath = "/ja\(components.percentEncodedPath)"
    return components.url ?? url
  }

  private static func validatedURL(_ value: String) -> URL {
    guard let url = URL(string: value) else {
      preconditionFailure("Invalid static URL: \(value)")
    }
    return url
  }
}
