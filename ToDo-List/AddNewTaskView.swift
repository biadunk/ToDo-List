import SwiftUI

struct AddNewTaskView: View {
  @Binding var todoTask: [Task]
  @Environment(\.dismiss) var dismiss
  @State private var newTaskDescrioption: String = ""
  
    var body: some View {
      NavigationStack {
        Form {
          TextField(text: $newTaskDescrioption) {
            Text("New task")
          }
        }
        
        Divider()
        Button("Add new task") {
          addNewTask()
        }
        .padding()
      }
    }
  private func addNewTask() {
    let newTask = Task(description: newTaskDescrioption)
    todoTask.append(newTask)
    dismiss()
  }
}

#Preview {
  AddNewTaskView(todoTask: .constant([]))
}
