//
//  LoginView.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                // Header
                HeaderView(
                    title: "To Do List", subtitle: "Get Things Done!", angle: 15, background: Color.pink
                    )
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                }
                // Login Form
                Form {
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.top, 10)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.top, 10)
                    
                        
                    TDLButton(title: "Log In", background: Color.pink) {
                        viewModel.login()
                    }

                }
                .frame(maxHeight: UIScreen.main.bounds.height * 0.30)
                .padding(.bottom, 10)
                
                // Create Account
                
                VStack{
                    Text("New Here?")
                    
                    NavigationLink("Create an account!", destination: RegisterView())
                }
                
                
                // Register
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
