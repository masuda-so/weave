# Weave

Weave is a communication app for thoughtful drafting and messaging. It includes
private local drafts, focused editing, and system sharing. Its on-device assistant
shows an editable revision alongside the original and never applies, saves, or
sends the result automatically.

## Initial navigation

- Drafts
- Assistant
- Pro
- Settings

## Commerce baseline

- `llc.ether.weave.pro.daily`: non-renewing 7-Day Pass with 7 days of access.
- `llc.ether.weave.pro.monthly`: auto-renewable monthly plan.
- `llc.ether.weave.pro.yearly`: auto-renewable yearly plan.

The 7-Day Pass never renews automatically. App Store Connect products and pricing
must be configured and reviewed before these plans can be sold.
Its 7-day expiration is calculated locally from StoreKit's verified purchase date
and the device wall clock. This release doesn't use a server-authoritative clock.
The on-device assistant is the initial Pro capability; the core app remains usable
without a purchase. An active 7-Day Pass cannot be repurchased or stacked.

## Implementation ownership

- Apple Foundation Models provides on-device generation when the system supports it.
- Weave owns its prompt construction and AI client implementation locally.
- Weave owns its StoreKit integration locally, while Daily, Monthly, and Yearly retain the common plan shape used across the app family.
