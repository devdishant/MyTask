//
//  Task.swift
//  MyTask
//
//  Created by DishantPatel on 03/06/24.
//

import Foundation

struct Task {
    let id: Int
    var name: String
    var description: String
    var isCompleted: Bool
    var finishDate: Date
    
    static func createMockTasks() -> [Task] {
        return [
            Task(id: 1, name: "Go to gym", description: "Back workout", isCompleted: false, finishDate: Date()),
            Task(id: 2, name: "Grocessary shopping", description: "buy vegetables", isCompleted: false, finishDate: Date()),
            Task(id: 3, name: "Go to playgorund", description: "Play basketball", isCompleted: true, finishDate: Date())
        ]
    }
}
