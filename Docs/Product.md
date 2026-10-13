# Weave

Weave is a communication app for thoughtful drafting and messaging. It includes
private local drafts, focused editing, and system sharing.

## Initial navigation

- Drafts
- Assistant
- Pro
- Settings

## Commerce baseline

- `llc.ether.weave.pro.daily`: non-renewing Daily Pass with 24 hours of access.
- `llc.ether.weave.pro.monthly`: auto-renewable monthly plan.
- `llc.ether.weave.pro.yearly`: auto-renewable yearly plan.

The Daily Pass never renews automatically. App Store Connect products and pricing
must be configured and reviewed before these plans can be sold.
Its 24-hour expiration is calculated locally from StoreKit's verified purchase date
and the device wall clock. This release doesn't use a server-authoritative clock.
The on-device assistant is the initial Pro capability; the core app remains usable
without a purchase. An active Daily Pass cannot be repurchased or stacked.

## Implementation ownership

- Apple Foundation Models provides on-device generation when the system supports it.
- Weave owns its prompt construction and AI client implementation locally.
- Weave owns its StoreKit integration locally, while Daily, Monthly, and Yearly retain the common plan shape used across the app family.
