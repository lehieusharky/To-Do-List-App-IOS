//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // header
                AuthHeaderView(
                    title: "To Do App",
                    subTitle: "Login",
                    backgroundColor: Color.blue,
                    degreeAngle: 15)
                    
                // form
                Form {
                    TextField("Email Address", text: $viewModel.emailText)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.passwordText)
                            .textFieldStyle(DefaultTextFieldStyle())
                    
                    // error message when validate
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                    }
                    
                    MyButtonView(
                        title: "Login",
                        backgroundColor: .blue
                    ) {
                        viewModel.login()
                    }
                }
                
                // bottom action
                VStack {
                    Text("New around here?")
                    
                    NavigationLink("Create an account",
                                   destination: RegisterView())
                }
                .padding(.bottom, 50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
