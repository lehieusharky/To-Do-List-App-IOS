//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListAppApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
