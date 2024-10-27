import Foundation

struct Task: Identifiable {
  var id = UUID()
  var description: String
  var isDone: Bool = false
}
