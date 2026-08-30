# Weave App Store submission record

Status updated: August 30, 2026. This is a release gate, not a promise of a
submission or public-release date.

## App identity

- Name: Weave
- Bundle ID: `llc.ether.weave`
- Minimum deployment target: iOS 18.0
- Devices: iPhone and iPad
- Primary category and age rating: human/App Store Connect decision
- App record, SKU, version, build number, copyright, export-compliance answer,
  and content-rights answer: confirm in App Store Connect against the Archive

## In-App Purchases

| Product ID | Type | Local contract |
| --- | --- | --- |
| `llc.ether.weave.pro.daily` | Non-renewing subscription | Pro for 24 hours from the latest verified purchase date; no stacking |
| `llc.ether.weave.pro.monthly` | Auto-renewable subscription | Pro while a verified entitlement is active |
| `llc.ether.weave.pro.yearly` | Auto-renewable subscription | Pro while a verified entitlement is active |

Monthly and Yearly must be in one subscription group at the same level. Product
type, localization, pricing, availability, tax/category data, review screenshots,
and the first-product submission must be verified by an App Store Connect user.
The signed App Store records control price and period; the local StoreKit file is
test data and is excluded from the app bundle.

## Fixed public URLs

- Privacy Policy: `https://ether-llc.com/apps/weave/privacy/`
- Terms of Use: `https://ether-llc.com/apps/weave/terms/`
- Support: `https://ether-llc.com/apps/weave/support/`

Settings links all three production URLs, and the purchase surface links Privacy
and Terms. Before submission, verify that the pages are reachable without
authentication, readable on mobile, and consistent with the final binary.
Publication remains an external gate.

## Privacy and platform declarations

- Product docs and current implementation state that drafts remain in the local
  SwiftData store, Foundation Models requests run on device, and Ether LLC does
  not receive prompts, generated text, analytics, advertising identifiers, or
  payment-card details.
- `PrivacyInfo.xcprivacy` declares no tracking and no collected data.
- Recheck the final source, dependencies, Archive, and App Privacy Report before
  confirming that `NSPrivacyAccessedAPITypes` may remain empty.
- The App Store privacy questionnaire, age rating, encryption/export-compliance,
  content rights, and regional legal answers require a responsible human to
  compare the final binary and published policies.

## Review notes to prepare

- Explain that the free core is a private local draft library; Pro adds an
  explicitly invoked on-device writing assistant.
- Explain Foundation Models availability requirements and show the usable
  non-AI path on unsupported devices/languages.
- Explain that Daily Pass is non-renewing, begins at the latest verified purchase
  date, expires after 24 hours according to the device wall clock, and does not
  stack on repurchase.
- Provide navigation to Pro, Restore Purchases, Manage Subscription, Privacy
  Policy, Terms of Use, and Support.
- Provide distinct screenshots and copy that describe Weave's drafting workflow,
  not a family-wide generic shell, for guideline 4.3 review.
- If review needs a specific account, state that Weave has no account system.

## Icon record

Submit the current layered `weave/Resources/AppIcon.icon`. Rebuild it with stable
Xcode and inspect the built icon at required sizes in Default, Dark, Clear, and
Tinted appearances. Apple Developer Support case `20000121467132` is retained
only as historical correspondence; App Review makes the final call.

## Technical gate

- [ ] Static, privacy, localization, and resource checks pass on the final
      working tree with stable Xcode.
- [ ] Stable-Xcode Debug and Release builds pass against an Apple-distributed SDK.
- [ ] Non-StoreKit tests pass on a compatible Apple Simulator runtime.
- [ ] Release Analyze passes for the submitted app target.
- [ ] An unsigned generic-iOS Archive succeeds and its contents are audited.
- [ ] StoreKit end-to-end suite passes without skips on a compatible Apple
      runtime, compatible physical device, or TestFlight environment.
- [ ] Distribution-signed Archive validates in App Store Connect.
- [ ] TestFlight purchase/restore/expiry and device checks pass.
- [ ] Legal URLs are publicly reachable and match the shipped behavior.
- [ ] App Store metadata, screenshots, review notes, privacy answers, IAPs, and
      subscriptions receive human approval.

Signing, validation, upload, TestFlight distribution, publication, and external
messages are intentionally outside this local reconstruction unless separately
authorized.

Record fresh commands, environment, results, and final Archive evidence in the
release process; do not reuse earlier working-tree evidence. The remaining gates
are summarized in [Release.md](Release.md).
