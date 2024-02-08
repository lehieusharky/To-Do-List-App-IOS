//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import SwiftUI

struct LoginView: View {
    
    @State var emailText = ""
    @State var passwordText = ""
    
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
                    TextField("Email Address", text: $emailText)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password Address", text: $passwordText)
                            .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.blue)
                            
                            Text("Login")
                                .foregroundColor(Color.white)
                                .font(.system(size: 20))
                                .bold()
                        }
                    }
                    .padding(.vertical, 10)
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
