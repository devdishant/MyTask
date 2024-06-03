//
//  HomeView.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var taskViewModel: TaskViewModel = TaskViewModel()
    
    var body: some View {
        
        NavigationStack {
            
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
        }
    }
}

#Preview {
    HomeView()
}
