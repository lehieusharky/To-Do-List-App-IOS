//
//  DashboardView.swift
//  ToDoListApp
//
//  Created by Le Hieu on 09/02/2024.
//

import SwiftUI

struct DashboardView: View {
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    var body: some View {
        TabView {
            ToDoListView(userID: userID)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView(userID: userID)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView(userID: "")
    }
}
