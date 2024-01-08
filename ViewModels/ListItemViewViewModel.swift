//
//  ListItemViewViewModel.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// View for Single To Do List Item (Each Row)
/// 
class ListItemViewViewModel: ObservableObject {
    init() {}
    
    public func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("tasks")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
