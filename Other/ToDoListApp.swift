//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
