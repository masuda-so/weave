import SwiftData
import SwiftUI

@main
struct WeaveApp: App {
  @Environment(\.scenePhase) private var scenePhase
  @State private var environment = AppEnvironment()
  @State private var dataContainer = DataContainer()

  var body: some Scene {
    WindowGroup {
      AppRootView()
        .environment(environment)
        .environment(dataContainer)
        .modelContainer(dataContainer.modelContainer)
        .task {
          await environment.start()
        }
        .onChange(of: scenePhase) { _, newPhase in
          guard newPhase == .active else { return }
          Task {
            await environment.refreshAIAvailability()
          }
        }
    }
  }
}
