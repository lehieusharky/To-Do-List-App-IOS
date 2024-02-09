//
//  UserModel.swift
//  ToDoListApp
//
//  Created by Le Hieu on 08/02/2024.
//

import Foundation

struct UserModel : Codable {
    let id: String
    let email: String
    let name: String
    let joined: TimeInterval
}
