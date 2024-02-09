//
//  CreateToDoItemView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import SwiftUI

struct CreateToDoItemView: View {
    @StateObject var viewModel = CreateToDoItemViewViewModel()
    @Binding var showCreateToDoView : Bool
    
    var body: some View {
        VStack {
            Text("Create new to do item")
                .font(.system(size: 20))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.titleText)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                MyButtonView(title: "Save", backgroundColor: .blue) {
                    viewModel.save()
                    showCreateToDoView = false
                }
            }
        }
    }
}

struct CreateToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        CreateToDoItemView(showCreateToDoView: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
