//
//  MyButtonView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import SwiftUI

struct MyButtonView: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .bold()
            }
        }
        .padding(.vertical, 10)
        
    }
    
}

struct MyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MyButtonView(title: "", backgroundColor: .blue) {
            
        }
    }
}
