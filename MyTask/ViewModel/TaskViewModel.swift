//
//  TaskViewModel.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import Foundation

final class TaskViewModel : ObservableObject {
    @Published var task: [Task] = []
    
    func getTasks(isActive: Bool) {
        task = Task.createMockTasks().filter({$0.isActive == isActive})
    }
}
