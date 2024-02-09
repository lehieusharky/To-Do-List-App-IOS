//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoItemModel]
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "Users/\(userID)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(itemID: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
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
