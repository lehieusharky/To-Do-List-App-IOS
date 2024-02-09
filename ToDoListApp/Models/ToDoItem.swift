//
//  ToDoItem.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import Foundation

struct ToDoItemModel : Codable, Identifiable {
    let id: String
    var title: String
    var dueDate: TimeInterval
    let createAt: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) -> Void {
        isDone = state
    }
}
