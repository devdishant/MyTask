//
//  HomeView.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var taskViewModel: TaskViewModel = TaskViewModel()
    @State private var pickerFilters: [String] = ["Active", "Complated"]
    @State private var defaultpickerSelectedItem: String = "Active"
    @State private var showAddTaskView: Bool = false

    var body: some View {
        
        NavigationStack {
            
            Picker("Picker Filter", selection: $defaultpickerSelectedItem) {
                ForEach(pickerFilters, id:\.self) {
                    Text($0)
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultpickerSelectedItem) { newValue in
                    taskViewModel.getTasks(isActive: defaultpickerSelectedItem == "Active")
                }
            
            List(taskViewModel.tasks, id: \.id) { task in
                VStack(alignment: .leading) {
                    Text(task.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    HStack {
                        Text(task.description).font(.subheadline)
                            .lineLimit(2)
                        Spacer()
                        Text("\(task.finishDate.toString())")
                    }
                }
            }.onAppear {
                taskViewModel.getTasks(isActive: true)
            }.listStyle(.plain)
            .navigationTitle("Home")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showAddTaskView = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(taskModel: taskViewModel, 
                            showAddTaskView: $showAddTaskView)
            }
        }
    }
}

#Preview {
    HomeView()
}
