//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import Foundation
import FirebaseFirestore


/// ViewModel for the List
/// Primary Tab
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    /// Delete to do list item
    /// - Parameter id: ID of item to be deleted
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userID)
            .collection("tasks")
            .document(id)
            .delete()
        return
    }
    
}
