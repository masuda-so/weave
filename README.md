# Weave

Weave is a private drafting space for shaping messages before sharing them
through the system share sheet.

## Main navigation

- Drafts
- Assistant
- Pro
- Settings

## Core experience

Drafts are stored on device with SwiftData. The app supports creation, focused
editing, sharing, and deletion with visible save and delete failure states.

## Intelligence and commerce

The assistant uses Apple Foundation Models on supported devices and languages.
It loads a saved or new draft into the composer, shows the original beside an
editable generated revision, and requires confirmation before saving or applying.
Sharing opens the system share sheet and never sends automatically. The local
StoreKit configuration provides:

- `llc.ether.weave.pro.daily`: non-renewing 24-hour Daily Pass.
- `llc.ether.weave.pro.monthly`: auto-renewable monthly plan.
- `llc.ether.weave.pro.yearly`: auto-renewable yearly plan.

App Store Connect product records, production prices, and review metadata remain
external release tasks.

## Documentation

- [Product scope](Docs/Product.md)
- [Privacy](Docs/Privacy.md) and [Terms](Docs/Terms.md)
- [Implementation references](Docs/References.md)
- [Release readiness](Docs/Release.md)
- [App Store submission record](Docs/App-Store-Submission.md)
- [Third-party notices](THIRD_PARTY_NOTICES.md)

Published public routes:

- `https://ether-llc.com/apps/weave/privacy/`
- `https://ether-llc.com/apps/weave/terms/`
- `https://ether-llc.com/apps/weave/support/`

Deployment, signing, upload, and release are not repository-local steps.
