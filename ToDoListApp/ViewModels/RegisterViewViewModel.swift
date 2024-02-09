//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel : ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var validatePasswordText = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    func register() -> Void {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: emailText, password: passwordText) {
            (result, error) in
            guard let userId = result?.user.uid else {
                return
            }
            
            self.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let user = UserModel(id: id, email: emailText, name: emailText, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(id)
            .setData(user.asDictionary())
    }
    
    private func validateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: emailText)
    }
    
    private func validateEmptyFields() -> Bool {
        guard !emailText.trimmingCharacters(in: .whitespaces).isEmpty,
              !passwordText.trimmingCharacters(in: .whitespaces).isEmpty,
              !validatePasswordText.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        
        return true
    }
    
    func validate() -> Bool {
        guard validateEmptyFields() else {
            errorMessage = "Please fill all fields!"
            return false
        }
        
        guard validateEmail() else {
            errorMessage = "Invalid email!"
            return false
        }
        
        guard passwordText == validatePasswordText else {
            errorMessage = "Validate password failed!"
            return false
        }
        
        errorMessage = ""
        return true
    }
    
    
}
