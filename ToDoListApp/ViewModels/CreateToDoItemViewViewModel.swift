//
//  CreateToDoItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class CreateToDoItemViewViewModel : ObservableObject{
    @Published var titleText = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {
        
    }
    
    func save() -> Void {
        guard validate() else {
            return
        }
        
        // create model
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let toDoItemID = UUID().uuidString
        
        let toDoItemModel = ToDoItemModel(
            id: toDoItemID,
            title: titleText,
            dueDate: dueDate.timeIntervalSince1970,
            createAt: Date().timeIntervalSince1970,
            isDone: false)
        
        // save to db
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(toDoItemID)
            .setData(toDoItemModel.asDictionary())
    }
    
    func validate() -> Bool {
        guard !titleText.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
