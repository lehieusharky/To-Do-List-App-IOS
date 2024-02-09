//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import FirebaseFirestore
import Foundation


class ToDoListViewViewModel : ObservableObject {
    @Published var showingCreateToDoItem  = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(itemID: String) -> Void {
        let db = Firestore.firestore()
        
        db.collection("Users")
            .document(userId)
            .collection("todos")
            .document(itemID)
            .delete()
    }
}
