import SwiftData
import SwiftUI

struct DraftsView: View {
  @Environment(\.modelContext) private var context
  @Query(sort: \Draft.updatedAt, order: .reverse) private var drafts: [Draft]
  @State private var isEditorPresented = false
  @State private var deletionError: String?

  var body: some View {
    NavigationStack {
      Group {
        if drafts.isEmpty {
          ContentUnavailableView(
            "No Drafts Yet",
            systemImage: "text.badge.plus",
            description: Text("Create a thoughtful message to begin.")
          )
        } else {
          List {
            ForEach(drafts) { draft in
              NavigationLink {
                DraftEditorView(draft: draft)
              } label: {
                VStack(alignment: .leading, spacing: 6) {
                  Text(draft.title)
                    .font(.headline)
                    .lineLimit(1)

                  if !draft.text.isEmpty {
                    Text(draft.text)
                      .foregroundStyle(.secondary)
                      .lineLimit(2)
                  }

                  Text(
                    draft.updatedAt,
                    format: .dateTime.month().day().hour().minute()
                  )
                  .font(.caption)
                  .foregroundStyle(.tertiary)
                }
              }
            }
            .onDelete(perform: deleteDrafts(indexes:))
          }
        }
      }
      .navigationTitle("Drafts")
      .toolbar {
        ToolbarItem {
          Button("New Draft", systemImage: "plus", action: addDraft)
        }
        ToolbarItem(placement: .topBarTrailing) {
          EditButton()
        }
      }
      .sheet(isPresented: $isEditorPresented) {
        NavigationStack {
          DraftEditorView(draft: nil)
        }
        .interactiveDismissDisabled()
      }
      .alert("Delete Failed", isPresented: isShowingDeletionError) {
        Button("OK", role: .cancel) {
          deletionError = nil
        }
      } message: {
        Text(deletionError ?? String(localized: "Please try again."))
      }
    }
  }

  private func addDraft() {
    isEditorPresented = true
  }

  private func deleteDrafts(indexes: IndexSet) {
    do {
      try context.performTransactionOrRollback {
        for index in indexes {
          context.delete(drafts[index])
        }
      }
    } catch {
      deletionError = error.localizedDescription
    }
  }

  private var isShowingDeletionError: Binding<Bool> {
    Binding(
      get: { deletionError != nil },
      set: { if !$0 { deletionError = nil } }
    )
  }
}

#Preview {
  DraftsView()
    .sampleDataContainer()
}
