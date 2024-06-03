//
//  TaskViewModel.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import Foundation

final class TaskViewModel : ObservableObject {
    @Published var tasks: [Task] = []
    
    func getTasks(isActive: Bool) {
        tasks = Task.createMockTasks().filter({$0.isActive == isActive})
    }
}
