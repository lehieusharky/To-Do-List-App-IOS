//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel : ObservableObject {
    @Published var emailText = ""
    @Published var passwordText = ""
    @Published var errorMessage = ""
    
    init() {
        
    }
    
    
    
    func login() -> Void {
        guard validate() else {
            return
        }
        
        Auth.auth().signIn(withEmail: emailText, password: passwordText) {
            (result, error) in
            if error != nil {
                self.errorMessage = error?.localizedDescription ?? ""
            }
        }
        
    }
    
    private func validateEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return emailPred.evaluate(with: emailText)
    }
    
    private func validateEmptyFields() -> Bool {
        guard !emailText.trimmingCharacters(in: .whitespaces).isEmpty,
              !passwordText.trimmingCharacters(in: .whitespaces).isEmpty else {
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
            errorMessage = "Invalid email"
            return false
        }
        
        errorMessage = ""
        return true
    }
}
