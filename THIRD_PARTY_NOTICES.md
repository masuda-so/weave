# Third-Party Notices

This file supplements, and does not replace, the repository LICENSE. It records
Apple-distributed sample code that Weave actually adapts, together with the local
scope of each adaptation. A documentation link or use of a public Apple API by
itself is not treated as copied sample code.

Apple names and links below identify sources and license terms only. Nothing in
this file states or implies that Apple sponsors, endorses, or approves Weave.
Product identifiers, prompts, pricing, user-facing copy, and the 24-hour Daily
Pass policy are local work.

The shipping Icon Composer composition in `weave/Resources/AppIcon.icon` is local
artwork, not Apple sample code or an SF Symbol. Apple icon documentation is used
only for canvas, mask, appearance, and packaging guidance.

## SwiftData Animals editor and list presentation

Source:

- https://developer.apple.com/documentation/swiftdata/adding-and-editing-persistent-data-in-your-app
- Distributed sample archive: https://docs-assets.developer.apple.com/published/f84bac78ac34/SwiftDataAnimals.zip
- Archive SHA-256: `19cfd5ca12831b9b112d9d6fead2a35ff25293ad47e291d7169e52e8a6c241d5`
- Embedded Git revision: `3b63bd5ec368dabcebbbda35554b2093a1ccff70`
- `LICENSE/LICENSE.txt` SHA-256: `39f3ea9e9fc438419ed8c132f2a6a5f45f6f2d6ba47df100513f2b65d751aecd`
- `SwiftDataAnimals/Views/AnimalEditor.swift` SHA-256: `cd8d4306de85a498a46a799bc03fb0cbf86d2bd648351f3a5714693b0a4c4aec`
- `SwiftDataAnimals/Views/AnimalListView.swift` SHA-256: `132b7a9145b774ee3d5395779400434e02f89f3e30cf43b2ba2379e1035ab14e`

Applied scope: `weave/App/Drafts/DraftEditorView.swift` adapts the
optional-model, staged-state, Save/Cancel, `onAppear`, and update-or-insert units
from `SwiftDataAnimals/Views/AnimalEditor.swift`.
`weave/App/Drafts/DraftsView.swift` adapts the Boolean sheet state, add action,
and nil-model editor presentation from
`SwiftDataAnimals/Views/AnimalListView.swift`. Weave's model fields, validation,
timestamps, transactions/rollback, rows, ordering, deletion, alerts, Share
action, and product copy are local.

The distributed `LICENSE/LICENSE.txt` states:

~~~text
Copyright © 2023 Apple Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

~~~

## Rendered Develop in Swift material reviewed but not adopted

The rendered `MovieList.swift` and `MovieDetail.swift` units at
https://developer.apple.com/tutorials/develop-in-swift/create-update-and-delete-data
were inspected as comparative references.

The downloadable project is only a starter snapshot: it contains an earlier
`MovieList.swift` and no `MovieDetail.swift`. Its MIT license is therefore not
represented as licensing the final units delivered separately in rendered JSON.
The claimed staged-editor and sheet-presentation sources are the separately
licensed SwiftData Animals units above; no source-adoption claim is made for the
rendered Develop in Swift units.

## Writing App StoryView presentation kernel

Source:

- https://developer.apple.com/documentation/swiftui/building-a-document-based-app-with-swiftui
- Distributed sample archive: https://docs-assets.developer.apple.com/published/ef10bd7eff0d/BuildingADocumentBasedAppWithSwiftUI.zip

Applied scope: `weave/App/Drafts/DraftEditorView.swift` adapts
`WritingApp/Views/StoryView.swift`'s focus state, `TextEditor` style and focus
modifier chain, padding, background, clipping, 13-point rounded rectangle,
shadow, 700-point maximum width, outer width, and padding. Draft persistence,
the title field, navigation and save/share toolbar, error handling, and maximum
height are local. The original file's SHA-256 is
`777477efd55f70d53e509857cc5c996afda60f1139c4f15299ea2f813fb647e9`.
The sample's `DocumentGroup`, `WritingAppDocument: FileDocument`, background
artwork, and story sheet are outside the adopted unit.

The distributed `LICENSE.txt` states:

~~~text
Copyright © 2024 Apple Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
~~~

## Grateful Moments data-container pattern

Source:

- https://developer.apple.com/tutorials/develop-in-swift/collect-model-and-store-data
- Inspected sample archive: https://docs-assets.developer.apple.com/published/3a1c7e5364ceea203334a98884e0559e/GratefulMoments-InvestigateAndFixABug.zip

Applied scope: weave/Services/Data/DataContainer.swift adapts the tutorial's
Schema, ModelConfiguration, ModelContainer, main-context, and in-memory preview
modifier structure. Draft replaces the tutorial models. Badge management, sample
insertion, the initial save, and the shared sample container are removed; each
Weave preview receives a fresh empty in-memory container.

The distributed tutorial archive LICENSE.txt states:

~~~text
Copyright © 2021 Apple Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
~~~

## Adding intelligent app features with generative models

Source:

- https://developer.apple.com/documentation/foundationmodels/adding-intelligent-app-features-with-generative-models
- Distributed sample archive: https://docs-assets.developer.apple.com/published/5414fd17db13/AddingIntelligentAppFeaturesWithGenerativeModels.zip
- Retrieved: 2026-08-04; archive verified again: 2026-08-12
- Archive SHA-256: `8d0f6e93cdcd93b7ac25a12af4b217c744ab814eb79d90772ca52dfbdad91631`
- `LICENSE.txt` SHA-256: `0817cde0fddac2eb0ca60ad88df24595790f3ac5f02ea1da9e13e902974d9711`
- `FoundationModelsTripPlanner/FoundationModelsTripPlanner/Views/Itinerary/TripPlanningView.swift`
  SHA-256: `9b0ae21926aff51ca55f312b7ba324f0c0afc8f6e9ed7f6e11a659196a9624d6`

Applied scope: `weave/App/Assistant/AssistantView.swift` adapts the body-level
availability presentation, while
`weave/Services/AI/FoundationModelAIClient.swift` adapts the
`SystemLanguageModel.default` availability switch. The Pro gate, prompt, task,
response, locale policy, stable errors, compiler guards, and product copy remain
local.

The distributed `LICENSE.txt` states:

~~~text
Copyright 2025 Apple Inc. All Rights Reserved.

IMPORTANT:  This Apple software is supplied to you by Apple
Inc. ("Apple") in consideration of your agreement to the following
terms, and your use, installation, modification or redistribution of
this Apple software constitutes acceptance of these terms.  If you do
not agree with these terms, please do not use, install, modify or
redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and
subject to these terms, Apple grants you a personal, non-exclusive
license, under Apple's copyrights in this original Apple software (the
"Apple Software"), to use, reproduce, modify and redistribute the Apple
Software, with or without modifications, in source and/or binary forms;
provided that if you redistribute the Apple Software in its entirety and
without modifications, you must retain this notice and the following
text and disclaimers in all such redistributions of the Apple Software.
Neither the name, trademarks, service marks or logos of Apple Inc. may
be used to endorse or promote products derived from the Apple Software
without specific prior written permission from Apple.  Except as
expressly stated in this notice, no other rights or licenses, express or
implied, are granted by Apple herein, including but not limited to any
patent rights that may be infringed by your derivative works or by other
works in which the Apple Software may be incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
~~~

## Implementing a store in your app using the StoreKit API

Source:

- https://developer.apple.com/documentation/storekit/implementing-a-store-in-your-app-using-the-storekit-api
- Distributed sample archive: https://docs-assets.developer.apple.com/published/623bce0ddaba/ImplementingAStoreInYourAppUsingTheStoreKitAPI.zip
- Retrieved: 2026-08-04; archive verified again: 2026-08-12
- Archive SHA-256: `26c7a9ee9329ebc3e26c15300eab9d332c803edd00236b0eefdf50276eca1e5a`
- `LICENSE.txt` SHA-256: `136e1d3db1b892bc26b03969250fbf0668dafcf09ced3ec2e9fe0ac832f7e20d`
- `SKDemo/Model/SKDemoPlusStatus.swift` SHA-256:
  `43df30db78cc0fcf36cf686f07ad9ee3c414bad5e87176225855055950c7f431`
- `SKDemo/In App Purchase/CustomerEntitlements.swift` SHA-256:
  `ae3a815a82dcf0e87fbb380962cc96b782785d633f717d80ba26e181d4992ed3`

Applied scope: `weave/Models/AccessLevel.swift` adapts the official access-level
enum to the app's free/Pro boundary.
`weave/App/General/AppEnvironment.swift` adapts the retained transaction task,
weak capture, and isolated-deinit cancellation lifecycle to the local snapshot
boundary. Product identifiers, entitlement aggregation, and UI policy remain
local or are separately attributed.

The distributed `LICENSE.txt` states:

~~~text
Copyright 2026 Apple Inc. All Rights Reserved.

IMPORTANT:  This Apple software is supplied to you by Apple
Inc. ("Apple") in consideration of your agreement to the following
terms, and your use, installation, modification or redistribution of
this Apple software constitutes acceptance of these terms.  If you do
not agree with these terms, please do not use, install, modify or
redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and
subject to these terms, Apple grants you a personal, non-exclusive
license, under Apple's copyrights in this original Apple software (the
"Apple Software"), to use, reproduce, modify and redistribute the Apple
Software, with or without modifications, in source and/or binary forms;
provided that if you redistribute the Apple Software in its entirety and
without modifications, you must retain this notice and the following
text and disclaimers in all such redistributions of the Apple Software.
Neither the name, trademarks, service marks or logos of Apple Inc. may
be used to endorse or promote products derived from the Apple Software
without specific prior written permission from Apple.  Except as
expressly stated in this notice, no other rights or licenses, express or
implied, are granted by Apple herein, including but not limited to any
patent rights that may be infringed by your derivative works or by other
works in which the Apple Software may be incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
~~~

## Foundation Models Coffee Game

Source:

- https://developer.apple.com/documentation/foundationmodels/generate-dynamic-game-content-with-guided-generation-and-tools
- Distributed sample archive: https://docs-assets.developer.apple.com/published/86c65aeb21cc/GenerateDynamicGameContentWithGuidedGenerationAndTools.zip
- Archive SHA-256: `74296318d9d9d025c080bc19a3e266045f4eb95c59188c309d7b108fb2d3c389`
- Embedded Git revision: `721e2007ed3ff4e55090698ace62807969893894`
- `LICENSE.txt` SHA-256: `ef80d1c2ac05c7040c0ced9d603c2c359712f90fdb3ece8da70b976981a69e89`
- `CoffeeGame/Views/MainMenuView.swift` SHA-256: `31ec6dbebe3f7e47b9cc501cb879a2a6e84ddf3a9bdd80559d77673940851d35`
- `CoffeeGame/Models/GenerateDialog/DialogEngine.swift` SHA-256: `872e648ebf234916144e3d360bd7f06d175f163446bd461b5a025284d217f011`
- `CoffeeGame/Models/GenerateEncounters/EncounterEngine.swift` SHA-256: `f3e2cf13d7a737fcefd4a7d5226c6f57975b69fd39ab0799b101482a0e3858f2`

Applied scope: `weave/App/Assistant/AssistantView.swift` adapts the availability
switch and generation-task cancellation units from `MainMenuView.swift` and
`GenerateDialog/DialogEngine.swift`.
`weave/Services/AI/FoundationModelAIClient.swift` adapts the per-operation
`LanguageModelSession`, prompt, `respond(to:)`, and response-content unit from
`GenerateEncounters/EncounterEngine.swift`. Pro access, app state, protocol
boundary, locale/empty-prompt guards, and product copy remain local.

The distributed LICENSE.txt states:

~~~text
Copyright © 2025 Apple Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

~~~

## Foundation Models Origami

Source:

- https://developer.apple.com/documentation/foundationmodels/origami-crafting-a-dynamic-tutorial-for-apple-intelligence
- Distributed sample archive: https://docs-assets.developer.apple.com/published/e843a4026a2e/OrigamiCraftingADynamicTutorialForAppleIntelligence.zip
- Archive SHA-256: `ce65cf2266eb8e69edf1eacdcdea82f97bda0ffed5b7accb61ab4df3c1a20c2a`
- Embedded Git revision: `e1705ac38f050049e8598061cda18b83a50c31b3`
- Apple Sample Code License: https://developer.apple.com/support/downloads/terms/apple-sample-code/Apple-Sample-Code-License.pdf
- `LICENSE.txt` SHA-256: `d18c34e657bcc2cd125a3c9c8d731ded98e02b2abe62b885defa9991e5054649`
- `Models/Error+DisplayMessage.swift` SHA-256: `0609f3a644c92b5f8bf64cc08a0e3390fbf4adc0e78123788e02350d5c5e4af7`
- `Brainstorm/BrainstormOrchestrator.swift` SHA-256: `69a48eb3c581ea7585297b446bfe63f442a333ca5029a1965c4861fbe9118dc5`
- `Terms/TermExtractor.swift` SHA-256: `782c96b2ab7fffcfaa87e787b701d877fb00972db9489cf5620f2a234f60bda1`
- `Terms/TermModel.swift` SHA-256: `decd3811dd33ec96d0f787c20a8b024c4a4da78351a7e025ebec9281661a9eae`

Applied scope: `weave/Services/AI/FoundationModelAIClient.swift` adapts the
`Prompt` result-builder unit from `Brainstorm/BrainstormInstructions.swift`, the
respond/content/post-response cancellation unit from `Terms/TermModel.swift`,
and the `SystemLanguageModel.Error` / `LanguageModelError` translation branches
from `Models/Error+DisplayMessage.swift`. Typed Weave errors, compiler/OS gates,
`LanguageModelSession.Error`, and safe app fallback are local additions.

The distributed `LICENSE.txt` states:

~~~text
Copyright © 2026 Apple Inc. All Rights Reserved.

IMPORTANT:  This Apple software is supplied to you by Apple
Inc. ("Apple") in consideration of your agreement to the following
terms, and your use, installation, modification or redistribution of
this Apple software constitutes acceptance of these terms.  If you do
not agree with these terms, please do not use, install, modify or
redistribute this Apple software.

In consideration of your agreement to abide by the following terms, and
subject to these terms, Apple grants you a personal, non-exclusive
license, under Apple's copyrights in this original Apple software (the
"Apple Software"), to use, reproduce, modify and redistribute the Apple
Software, with or without modifications, in source and/or binary forms;
provided that if you redistribute the Apple Software in its entirety and
without modifications, you must retain this notice and the following
text and disclaimers in all such redistributions of the Apple Software.
Neither the name, trademarks, service marks or logos of Apple Inc. may
be used to endorse or promote products derived from the Apple Software
without specific prior written permission from Apple.  Except as
expressly stated in this notice, no other rights or licenses, express or
implied, are granted by Apple herein, including but not limited to any
patent rights that may be infringed by your derivative works or by other
works in which the Apple Software may be incorporated.

The Apple Software is provided by Apple on an "AS IS" basis.  APPLE
MAKES NO WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION
THE IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS
FOR A PARTICULAR PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND
OPERATION ALONE OR IN COMBINATION WITH YOUR PRODUCTS.

IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
INTERRUPTION) ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION,
MODIFICATION AND/OR DISTRIBUTION OF THE APPLE SOFTWARE, HOWEVER CAUSED
AND WHETHER UNDER THEORY OF CONTRACT, TORT (INCLUDING NEGLIGENCE),
STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE.
~~~

## Understanding StoreKit Workflows

Source:

- https://developer.apple.com/documentation/storekit/understanding-storekit-workflows
- Distributed sample archive: https://docs-assets.developer.apple.com/published/6b864cb1ff7d/UnderstandingStoreKitWorkflows.zip
- Archive SHA-256: `95fc0905086308fd68e0c3f5559b20b9b57d8b6663e91466fee187a170987e72`
- Embedded Git revision: `061b2fb00576dc5b2b2fffea77873086d8b093a4`
- `LICENSE.txt` SHA-256: `ef80d1c2ac05c7040c0ced9d603c2c359712f90fdb3ece8da70b976981a69e89`
- `Store/Model/ProductID.swift` SHA-256: `922eff297649cd4ea4247573f97083007599f1c2adb6235469f8804df8327b2c`
- `Store/Model/Store.swift` SHA-256: `9c5ef74c118b7de50ca178e8b57457f79061fa4343410bbb6318cc61fbddb6e3`

Applied scope: `weave/Services/Commerce/WeaveCommerceCatalog.swift` adapts the
raw-value `ProductID` enum and grouped arrays from `ProductID.swift`.
`weave/Services/Commerce/StoreKitSubscriptionClient.swift` adapts the
unfinished/current/update transaction-sequence and verified-process-before-
`finish()` units from `Store.swift`. Weave's product values, nonrenewable group,
actor/protocol boundary, per-subscriber stream ownership, catalog filtering,
snapshots, clock, restore, errors, and Daily Pass calculation are local.

The distributed `LICENSE.txt` states:

~~~text
Copyright © 2025 Apple Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

~~~

## Apple GitHub interface units

Sources, pinned to the inspected revisions:

- Food Truck: https://github.com/apple/sample-food-truck/tree/3954a769e99f3cc53297d94f2b960ceb2665b3d6
- Backyard Birds: https://github.com/apple/sample-backyard-birds/tree/1843d5655bf884b501e2889ad9862ec58978fdbe

The scope is limited to:

- `weave/App/Settings/SettingsView.swift`: subscription-management state, button,
  and sheet modifier from Food Truck's `App/Store/StoreSupportView.swift`.
- `weave/App/Settings/RestorePurchasesButton.swift`: restore button task, `defer`,
  `AppStore.sync()`, disabled state, and preview from Backyard Birds'
  `Multiplatform/Account/RestorePurchasesButton.swift`.
- `weave/Components/CardView.swift`: padding and thin-material continuous
  rounded-rectangle modifiers from Food Truck's
  `App/City/CityWeatherCard.swift`.

Food Truck and Backyard Birds are not claimed as implementation sources for
`StoreKitSubscriptionClient.swift`. Both pinned repositories contain:

~~~text
Copyright © 2023 Apple Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
~~~

## Local-only boundaries

`ModelContext+Transaction.swift`, StoreKit configuration and scheme settings,
product identifiers, Daily Pass policy, prompts/instructions, and user-facing
copy remain local unless a narrower adopted unit is listed above. Native
framework API use alone creates no additional third-party source claim.
