import SwiftData
import SwiftUI

struct AssistantView: View {
  @Environment(AppEnvironment.self) private var environment
  @Environment(\.modelContext) private var modelContext
  @Query(sort: \Draft.updatedAt, order: .reverse) private var drafts: [Draft]

  @Binding var selection: AppSection

  @State private var text = ""
  @State private var generationTask: Task<Void, Never>?
  @State private var selectedDraftID: PersistentIdentifier?
  @State private var newDraftTitle = ""
  @State private var refinedText = ""
  @State private var hasComparison = false
  @State private var persistenceError: String?
  @State private var isConfirmingSave = false

  var body: some View {
    NavigationStack {
      Group {
        switch environment.aiAvailability {
        case .available:
          if environment.isPremium {
            assistantForm
          } else {
            lockedView
          }
        case .unavailable(.appleIntelligenceDisabled):
          unavailableView(
            message: String(
              localized: "The assistant is unavailable because Apple Intelligence isn’t turned on."
            )
          )
        case .unavailable(.modelNotReady):
          unavailableView(
            message: String(localized: "The assistant isn’t ready yet. Try again later.")
          )
        case .unavailable(let reason):
          unavailableView(message: reason.localizedDescription)
        }
      }
      .navigationTitle(environment.product.assistantTitle)
      .onDisappear {
        generationTask?.cancel()
        generationTask = nil
      }
      .alert("Save Failed", isPresented: isShowingPersistenceError) {
        Button("OK", role: .cancel) {
          persistenceError = nil
        }
      } message: {
        Text(persistenceError ?? String(localized: "Please try again."))
      }
      .confirmationDialog(
        saveConfirmationTitle,
        isPresented: $isConfirmingSave,
        titleVisibility: .visible
      ) {
        Button(saveActionTitle) {
          saveRefinedDraft()
        }
        Button("Cancel", role: .cancel) {}
      } message: {
        Text("Nothing changes until you confirm this action.")
      }
    }
  }

  private var assistantForm: some View {
    Form {
      Section("Source Draft") {
        Picker("Draft", selection: $selectedDraftID) {
          Text("New Draft").tag(nil as PersistentIdentifier?)
          ForEach(drafts) { draft in
            Text(draft.title).tag(Optional(draft.persistentModelID))
          }
        }
        .disabled(environment.isGenerating)
        .onChange(of: selectedDraftID) {
          loadSelectedDraft()
        }

        if selectedDraft == nil {
          TextField("Draft title", text: $newDraftTitle)
            .disabled(environment.isGenerating)
        }

        TextEditor(text: $text)
          .frame(minHeight: 130)
          .accessibilityLabel(environment.product.assistantInputTitle)
          .disabled(environment.isGenerating)
          .onChange(of: text) {
            if !environment.isGenerating {
              clearComparison()
            }
          }
      }

      Section {
        if environment.isGenerating {
          HStack {
            ProgressView()
            Text(environment.product.assistantProgressTitle)
            Spacer()
            Button("Stop", role: .cancel) {
              generationTask?.cancel()
            }
          }
        } else {
          Button {
            startGeneration()
          } label: {
            Label(environment.product.assistantActionTitle, systemImage: "sparkles")
              .frame(maxWidth: .infinity)
          }
          .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
      } footer: {
        Text(availabilityMessage)
      }

      if let errorMessage = environment.assistantErrorMessage {
        Section("Couldn’t Generate") {
          Text(errorMessage)
            .foregroundStyle(.secondary)
        }
      }

      if hasComparison {
        Section("Original Draft") {
          Text(text)
            .textSelection(.enabled)
        }

        Section {
          TextEditor(text: $refinedText)
            .frame(minHeight: 130)
            .accessibilityLabel(environment.product.assistantOutputTitle)

          Button(saveActionTitle) {
            isConfirmingSave = true
          }
          .disabled(!canSaveRefinedDraft)
          .buttonStyle(.borderedProminent)
          .tint(environment.product.accent)

          if !refinedText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            ShareLink(item: refinedText) {
              Label("Review and Share", systemImage: "square.and.arrow.up")
            }
          }

          Button("Discard Suggestion", role: .cancel) {
            clearComparison()
          }
        } header: {
          Text(environment.product.assistantOutputTitle)
        } footer: {
          Text(
            "Generated on this device with Apple Foundation Models. Review the comparison before applying or saving. Sharing opens the system share sheet and never sends automatically. AI output may be inaccurate."
          )
        }
      }
    }
  }

  private func startGeneration() {
    let requestText = text
    let requestedDraftID = selectedDraftID
    clearComparison()
    generationTask?.cancel()
    generationTask = Task {
      await environment.requestAssistantResponse(for: requestText)
      guard !Task.isCancelled, requestedDraftID == selectedDraftID else {
        generationTask = nil
        return
      }
      if let response = environment.assistantResponse {
        refinedText = response
        hasComparison = true
      }
      generationTask = nil
    }
  }

  private var selectedDraft: Draft? {
    guard let selectedDraftID else { return nil }
    return drafts.first { $0.persistentModelID == selectedDraftID }
  }

  private var comparison: ComposerDraftComparison {
    ComposerDraftComparison(original: text, refined: refinedText)
  }

  private var canSaveRefinedDraft: Bool {
    guard comparison.hasMeaningfulChange else { return false }
    return selectedDraft != nil
      || !newDraftTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
  }

  private var saveActionTitle: LocalizedStringKey {
    selectedDraft == nil ? "Save as New Draft" : "Apply to Draft"
  }

  private var saveConfirmationTitle: LocalizedStringKey {
    selectedDraft == nil ? "Save Refined Draft?" : "Apply Changes to Draft?"
  }

  private func loadSelectedDraft() {
    if let selectedDraft {
      newDraftTitle = selectedDraft.title
      text = selectedDraft.text
    } else {
      newDraftTitle = ""
      text = ""
    }
    clearComparison()
  }

  private func clearComparison() {
    environment.assistantResponse = nil
    refinedText = ""
    hasComparison = false
  }

  private func saveRefinedDraft() {
    let approvedText = refinedText.trimmingCharacters(in: .whitespacesAndNewlines)

    do {
      try modelContext.performTransactionOrRollback {
        if let selectedDraft {
          selectedDraft.text = approvedText
          selectedDraft.updatedAt = .now
        } else {
          modelContext.insert(
            Draft(
              title: newDraftTitle.trimmingCharacters(in: .whitespacesAndNewlines),
              text: approvedText
            )
          )
        }
      }
      clearComparison()
      selection = .drafts
    } catch {
      persistenceError = error.localizedDescription
    }
  }

  private var lockedView: some View {
    ContentUnavailableView {
      Label(
        "\(environment.product.assistantTitle) is a Pro feature",
        systemImage: "crown.fill"
      )
    } description: {
      Text(
        "Choose the non-renewing 7-Day Pass or an auto-renewing plan to use the on-device assistant."
      )
    } actions: {
      Button("View Pro options") {
        selection = .pro
      }
      .buttonStyle(.borderedProminent)
      .tint(environment.product.accent)
    }
  }

  private func unavailableView(message: String) -> some View {
    ContentUnavailableView {
      Label(environment.product.assistantTitle, systemImage: "apple.intelligence")
    } description: {
      Text(message)
    }
  }

  private var availabilityMessage: String {
    switch environment.aiAvailability {
    case .available:
      return String(localized: "Processed on this device with Apple Foundation Models.")
    case .unavailable(let reason):
      return String(
        localized:
          "\(reason.localizedDescription) \(environment.product.name) remains usable without the assistant."
      )
    }
  }

  private var isShowingPersistenceError: Binding<Bool> {
    Binding(
      get: { persistenceError != nil },
      set: { if !$0 { persistenceError = nil } }
    )
  }
}
