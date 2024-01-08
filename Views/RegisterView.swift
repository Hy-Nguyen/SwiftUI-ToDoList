//
//  RegisterView.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()

    var body: some View {
        VStack {
            // Header
            HeaderView(title: "Register", subtitle: "Fill out the form below!", angle: 15, background: Color.yellow)
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TDLButton(title: "Register", background: Color.yellow, textColor: Color.white) {
                    viewModel.register()
                }
            }
            .offset(y: 50)
            
        }
        Spacer()
    }
}

#Preview {
    RegisterView()
}
