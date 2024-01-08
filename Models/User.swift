//
//  User.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
