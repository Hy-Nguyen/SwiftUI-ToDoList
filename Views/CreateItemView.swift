//
//  CreateItemView.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI

struct CreateItemView: View {
    @StateObject var viewModel = CreateItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 80)
            
            Form{
                // Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding(.vertical, 8)
                
                // Due Date
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .accentColor(.green)
                
                // Button
                TDLButton(title: "Create Reminder", background: .green) {
                    // Action
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
                .padding(.vertical, 8)
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text("Please fill in all fields and select due date."))
            })
        }
    }
}

#Preview {
    CreateItemView(newItemPresented: Binding(get: {
        return true
    }, set: {_ in
        
    }))
}
