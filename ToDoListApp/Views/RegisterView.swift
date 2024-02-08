//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        NavigationView {
            VStack {
                // header
                AuthHeaderView(
                    title: "To Do List",
                    subTitle: "Regiser",
                    backgroundColor: Color.orange,
                    degreeAngle: -15)
                
                //
                Spacer()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
