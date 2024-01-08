//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
        func login() {
            guard validate() else {
                return
            }
            Auth.auth().signIn(withEmail: email, password: password)
            
        }
        
        private func validate() -> Bool {
            guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
                    !password.trimmingCharacters(in: .whitespaces).isEmpty else {
                errorMessage = "Please Fill in ALL Fields"
                return false
            }
            guard email.contains("@") && email.contains(".") else {
                errorMessage = "Please enter proper email"
                return false
            }
            
            return true
            
        }
    
}
