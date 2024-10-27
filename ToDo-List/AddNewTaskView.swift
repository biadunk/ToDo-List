import SwiftUI

struct AddNewTaskView: View {
  @Binding var todoTask: String
  
    var body: some View {
      NavigationStack {
        Form {
          TextField(text: $todoTask) {
            Text("New task")
          }
        }
        
        Divider()
        Button("Add new task") {
          //action
        }
        .padding()
      }
    }
}

#Preview {
  AddNewTaskView(todoTask: .constant(""))
}
