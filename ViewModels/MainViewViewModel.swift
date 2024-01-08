//
//  MainViewViewModel.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    @Published var currentUserID: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserID = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
    public func forceSignOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
}
