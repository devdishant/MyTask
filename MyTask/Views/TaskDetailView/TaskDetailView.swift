//
//  TaskDetailView.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var taskModel: TaskViewModel
    @Binding var showTaskDetailView: Bool
    @Binding var selectedTask: Task
    
    var body: some View {
        
        NavigationStack {
            List {
                Section(header: Text("Task Detail")) {
                    TextField("Task Name", text: $selectedTask.name)
                    TextEditor(text: $selectedTask.description)
                    Toggle("Mark Complete", isOn: $selectedTask.isCompleted)
                }
                
                Section(header: Text("Select date/time")) {
                    DatePicker("Task Date", selection: $selectedTask.finishDate)
                }
                
                Section {
                    Button {
                        print("Delete task")
                    } label: {
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                    }
                }
            }.navigationTitle("Task Detail")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showTaskDetailView.toggle()
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Update button tapped")
                        } label: {
                            Text("Update")
                        }
                    }
                }
        }
    }
}

#Preview {
    TaskDetailView(taskModel: TaskViewModel(), showTaskDetailView: .constant(false), selectedTask: .constant(Task.createMockTasks().first!))
}
