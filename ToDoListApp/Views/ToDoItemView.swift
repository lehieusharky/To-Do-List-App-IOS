//
//  ToDoItemView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import SwiftUI

struct ToDoItemView: View {
    @StateObject var viewModel = ToDoItemViewViewModel()
    
    let item: ToDoItemModel
    
    init(item: ToDoItemModel) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(size: 20))
                    .bold()
                
                Text((Date(timeIntervalSince1970: item.dueDate)
                    .formatted(date: .abbreviated, time: .shortened)))
                .font(.footnote)
                .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: self.item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            }
        }
        
    }
}

struct ToDoItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoItemView(
            item: .init(id: "", title: "",
                        dueDate: Date().timeIntervalSince1970,
                        createAt: Date().timeIntervalSince1970,
                        isDone: false))
    }
}
