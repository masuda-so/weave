# Weave

[日本語](README.md) | [English](README.en.md)

## Overview

Weave is a private drafting space for shaping messages before sharing them
through the system share sheet.

## Features and limitations

### Main navigation

- Drafts
- Assistant
- Pro
- Settings

### Core experience

Drafts are stored on device with SwiftData. The app supports creation, focused
editing, sharing, and deletion with visible save and delete failure states.

### Intelligence and commerce

The assistant requires active Pro access and uses Apple Foundation Models on supported devices and languages.
The local StoreKit configuration provides:

- `llc.ether.weave.pro.daily`: non-renewing 24-hour Daily Pass.
- `llc.ether.weave.pro.monthly`: auto-renewable monthly plan.
- `llc.ether.weave.pro.yearly`: auto-renewable yearly plan.

App Store Connect product records, production prices, and review metadata remain
external release tasks.

## Getting started and usage

Open `weave.xcodeproj` in Xcode and select the shared `weave` scheme.
See [repository structure and verification](Docs/Structure.md) for build and test guidance,
and [release gates](Docs/Release.md) for device and release requirements.
The local StoreKit configuration is for purchase testing, not proof of production availability.

## Support and documentation

- [Repository structure and verification](Docs/Structure.md)
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

## Development and contributions

GitHub Actions runs nine purchase-related scenarios in a dedicated StoreKit workflow alongside the normal CI. It verifies completion of the same transaction ID and compares an isolated run of that scenario with the full nine-test class. See [structure and validation](Docs/Structure.md#continuous-integration) for the environment, remaining warnings, and coverage. Passing CI does not establish behavior on physical devices or the production store.

Use the support route above for product help. For repository changes, consult the
implementation references and release gates linked above, and describe the change
and its validation in a pull request. PR descriptions and review comments use Japanese by default; an explicit request for another language takes precedence.

See [AGENTS.md](AGENTS.md) for shared repository instructions.
