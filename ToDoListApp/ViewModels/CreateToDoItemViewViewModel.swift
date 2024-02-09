//
//  CreateToDoItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import Foundation

class CreateToDoItemViewViewModel : ObservableObject{
    @Published var titleText = ""
    @Published var dueDate = Date()
    
    init() {
        
    }
    
    func save() -> Void {
        
    }
}
