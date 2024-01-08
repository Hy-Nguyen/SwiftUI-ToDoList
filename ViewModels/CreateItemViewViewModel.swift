//
//  CreateItemViewModel.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class CreateItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    public func save(){
        guard canSave else {
            return
        }
        // Get current userID
        guard let uID = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create a model
        let newID = UUID().uuidString
        let newItem = ToDoListItem(
            id: newID,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save a model
        // Save as a sub-collection of a user
        let db = Firestore.firestore()
        db.collection("users")
            .document(uID)
            .collection("tasks")
            .document(newID)
            .setData(newItem.asDictionary())
        return
    }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        
        return true
    }
    
}
