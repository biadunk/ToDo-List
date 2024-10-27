import SwiftUI

struct ContentView: View {
  
  @State var todoTask: [Task] = [
    Task(description: "Pierwszy do zrobienia"),
    Task(description: "Drugi do zrobienia"),
    Task(description: "Trzeci do zrobienia")
  ]
  @State var isPresenting: Bool = false
  
    var body: some View {
      NavigationView {
        VStack {
          List {
            ForEach(todoTask) { task in
              HStack {
                Image(systemName: task.isDone ? "circle.fill" : "circle")
                  .foregroundStyle(Color.blue)
                
                Text(task.description)
                  .padding()
                  .font(.title3)
              }
              .onTapGesture {
                toggleTaskCompletion(task)
              }
            }
            .onDelete(perform: deleteTask(at:))
          }
          
          Button("Add new") {
            isPresenting.toggle()
          }
          .padding()
          .background(Color.cyan)
          .clipShape(.capsule)
          .foregroundStyle(Color.white)
//          .sheet(isPresented: $isPresenting) {
//            AddNewTaskView(todoTask: $todoTask)
//          }
        }
        .navigationTitle("ToDo List")
      }
    }
  private func deleteTask(at offsets: IndexSet) {
    todoTask.remove(atOffsets: offsets)
  }
  
  private func toggleTaskCompletion(_ task: Task) {
    if let index = todoTask.firstIndex(where: { $0.id == task.id}) {
      todoTask[index].isDone.toggle()
    }
  }
}

#Preview {
    ContentView()
}
