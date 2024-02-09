//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // header
            AuthHeaderView(
                title: "To Do List",
                subTitle: "Regiser",
                backgroundColor: Color.orange,
                degreeAngle: -10)
            
            // form
            Form {
                TextField("Email Address",
                          text: $viewModel.emailText)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password",
                            text: $viewModel.passwordText)
                        .textFieldStyle(DefaultTextFieldStyle())
                
                SecureField("Validation password",
                            text: $viewModel.validatePasswordText)
                        .textFieldStyle(DefaultTextFieldStyle())
                
                if !viewModel.emailText.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .font(.system(size: 12))
                }
                
                MyButtonView(
                    title: "Register",
                    backgroundColor: .orange
                ) {
                    viewModel.register()
                }
            }
            
            //
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
