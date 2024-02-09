//
//  ToDoItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoItemViewViewModel : ObservableObject {
    
    init() {
    }
    
    func toggleIsDone(item: ToDoItemModel) -> Void {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(item.id)
            .updateData(["isDone" : !item.isDone])
    }
}
