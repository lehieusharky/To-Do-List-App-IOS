//
//  ProfileViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import FirebaseAuth

import Foundation

class ProfileViewViewModel : ObservableObject{
    init() {
        
    }
    
    func logOut() -> Void {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
