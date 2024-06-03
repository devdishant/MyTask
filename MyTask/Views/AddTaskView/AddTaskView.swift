//
//  AddTaskView.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskModel: TaskViewModel
    @State private var taskToAdd: Task = Task(id: 0, name: "", description: "", isActive: false, finishDate: Date())
    @Binding var showAddTaskView: Bool
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Task Detail")) {
                    TextField("Task Name", text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
                
                Section(header: Text("Select date/time")) {
                    DatePicker("Task Date", selection: $taskToAdd.finishDate)
                }
            }.navigationTitle("Add Task")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showAddTaskView = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            print("Add button tapped")
                        } label: {
                            Text("Add")
                        }
                    }
                }
        }
    }
}

#Preview {
    AddTaskView(taskModel: TaskViewModel(), showAddTaskView: .constant(false))
}
