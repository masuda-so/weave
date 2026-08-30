import SwiftData
import SwiftUI

struct DraftEditorView: View {
  let draft: Draft?

  @Environment(\.dismiss) private var dismiss
  @Environment(\.modelContext) private var context

  @FocusState private var isFocused: Bool
  @State private var title = ""
  @State private var text = ""
  @State private var persistenceError: String?

  var body: some View {
    VStack {
      TextField("Draft title", text: $title)
        .font(.title2.bold())

      TextEditor(text: $text)
        .font(.title)
        .textEditorStyle(.plain)
        .scrollIndicators(.never)
        .focused($isFocused)
        .accessibilityLabel(Text("Draft body"))
    }
    .padding(.horizontal, 30)
    .padding(.vertical, 20)
    .background(.background)
    .scrollClipDisabled()
    .clipShape(RoundedRectangle(cornerRadius: 13))
    .shadow(color: .black.opacity(0.2), radius: 5)
    .frame(maxWidth: 700)
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .padding()
    .navigationTitle(draft == nil ? Text("New Draft") : Text("Draft"))
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
      if draft == nil {
        ToolbarItem(placement: .cancellationAction) {
          Button("Cancel", role: .cancel) {
            dismiss()
          }
        }
      }

      ToolbarItemGroup(placement: .confirmationAction) {
        if !text.isEmpty {
          ShareLink(item: text) {
            Label("Share", systemImage: "square.and.arrow.up")
          }
        }

        Button("Save") {
          save()
        }
        .disabled(trimmedTitle.isEmpty)
      }
    }
    .onAppear {
      if let draft {
        title = draft.title
        text = draft.text
      }
      isFocused = true
    }
    .alert("Save Failed", isPresented: isShowingPersistenceError) {
      Button("OK", role: .cancel) {
        persistenceError = nil
      }
    } message: {
      Text(persistenceError ?? String(localized: "Please try again."))
    }
  }

  private var trimmedTitle: String {
    title.trimmingCharacters(in: .whitespacesAndNewlines)
  }

  private func save() {
    do {
      try context.performTransactionOrRollback {
        if let draft {
          draft.title = trimmedTitle
          draft.text = text
          draft.updatedAt = .now
        } else {
          context.insert(
            Draft(
              title: trimmedTitle,
              text: text
            )
          )
        }
      }
      dismiss()
    } catch {
      persistenceError = error.localizedDescription
    }
  }

  private var isShowingPersistenceError: Binding<Bool> {
    Binding(
      get: { persistenceError != nil },
      set: { if !$0 { persistenceError = nil } }
    )
  }
}
