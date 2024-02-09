//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    var body: some View {					
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingCreateToDoItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingCreateToDoItem) {
                CreateToDoItemView(showCreateToDoView: $viewModel.showingCreateToDoItem)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userID: "")
    }
}
