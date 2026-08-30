import Foundation
import SwiftData

/// An editable draft persisted by SwiftData.
@Model
final class Draft {
  var title: String
  var text: String
  var createdAt: Date
  var updatedAt: Date

  init(
    title: String,
    text: String = "",
    createdAt: Date = .now,
    updatedAt: Date = .now
  ) {
    self.title = title
    self.text = text
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}
