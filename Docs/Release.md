# Weave release readiness

Status updated: August 30, 2026. This is a release checklist, not a submission
or public-release claim.

## Implemented v1

- iOS 18 minimum deployment target with iPhone and iPad support.
- Swift 6 app and test targets, shared scheme, and repository `swift-format` rules.
- Local SwiftData draft creation, editing, deletion, persistence, rollback, and
  system sharing.
- On-device Foundation Models adapter with supported-device/language fallback,
  original/revision comparison, confirmation before applying or saving, explicit
  system-share action, cancellation, stable error vocabulary, and no remote AI
  provider.
- StoreKit 2 product loading, purchase, restore, verified-entitlement, finishing,
  update handling, refund/revocation filtering, and device-clock expiry policy.
- Non-renewing 7-Day Pass `llc.ether.weave.pro.daily`: 7 days from the latest
  verified purchase date, with no stacking.
- Auto-renewing `llc.ether.weave.pro.monthly` and
  `llc.ether.weave.pro.yearly` plans.
- Local StoreKit configuration selected by the Debug scheme and excluded from the
  app target so it is not distributed in the app bundle.
- Privacy manifest, English/Japanese String Catalogs, fixed production legal
  URLs, current layered `Resources/AppIcon.icon`, and third-party notices.

## Required local re-verification

The working tree has changed since the prior local verification record. Treat
all build, test, Analyze, and Archive results as pending. Use the currently
installed stable Xcode with an Apple-distributed compatible SDK and runtime.

Run and record:

- Static inspection of the project and scheme, Swift formatting, JSON/plist and
  String Catalog parsing, product identifiers, privacy manifest, and app-icon source.
- An unsigned Debug simulator build.
- The non-StoreKit test suite.
- Release app-target Analyze.
- An unsigned generic-iOS Release Archive and bundle audit: identifiers, version,
  minimum OS, privacy manifest, English/Japanese localization, compiled icons,
  and absence of `.storekit` and `.xctest` artifacts.
- StoreKit end-to-end checks separately on a compatible runtime, physical device,
  or TestFlight.

Do not carry forward old manifests or hashes; record fresh evidence against the
final working tree.

## App Store submission gates

- Create or confirm the App Store Connect app record for `llc.ether.weave`, its
  version/build record, Apple Distribution signing, and provisioning profile.
- Create and localize all three products. Put Monthly and Yearly in one
  subscription group at the same level, and submit first-time product types with
  the initial app version as required by App Store Connect.
- Confirm production prices, availability, tax/category details, and review
  screenshots; local StoreKit prices are test fixtures only.
- Pass all nine unskipped StoreKit scenarios: product loading, verified purchase
  and finish, unfinished-transaction processing, restore, 7-Day Pass boundary,
  Ask to Buy pending, refund removal, latest-purchase repurchase, and auto-renew
  cancellation with access through expiry.
- Publish and anonymously verify:
  - `https://ether-llc.com/apps/weave/privacy/`
  - `https://ether-llc.com/apps/weave/terms/`
  - `https://ether-llc.com/apps/weave/support/`
- Reconcile the final Archive/App Privacy Report with the App Store privacy,
  Required Reason API, encryption/export-compliance, age-rating, and content-rights
  answers.
- Prepare distinct Weave screenshots, value proposition, and review notes for
  guideline 4.3; verify the free path, assistant availability fallback, purchase,
  restore, Manage Subscription, legal links, Dynamic Type, VoiceOver labels,
  contrast, localization, iPad layout, and failure states.
- Decide whether users of any historical bundle ID need an explicit migration or
  export/import path; SwiftData content and purchases do not automatically move to
  a different app record.
- Complete a distribution-signed Archive, App Store validation, TestFlight,
  compatible-device purchase/restore/expiry checks, and final human approval.

## Icon disposition

`weave/Resources/AppIcon.icon` is the current source. Render it with stable
Xcode, inspect Default, Dark, Clear, and Tinted appearances at required sizes,
and confirm that the final Archive contains the compiled icon. App Review makes
the final determination.

## External or human blockers

Only Apple credentials/signing, App Store Connect records, an Apple-provided
StoreKit-capable environment, TestFlight/physical-device verification, public
legal-page deployment, and final legal/content/accessibility/UI judgment may
remain outside the local reconstruction. No signing, validation, upload, release,
deployment, publication, or external message is authorized by this record.
