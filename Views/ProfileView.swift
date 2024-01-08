//
//  ProfileView.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user:user)
                } else {
                    Text("user loading. . . ")
                }
            }
            .navigationTitle("Your Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user: User) -> some View{
            Spacer()
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.yellow)
                .frame(width: 125, height: 125)
            VStack(alignment: .leading){
                HStack {
                    Text("Name: ")
                    Text(user.name)
                }
                HStack {
                    Text("Email: ")
                    Text(user.email)
                }
                HStack {
                    Text("Member Since: ")
                    Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                }
                
            }
            Spacer()
            TDLButton(title: "Sign Out", background: .yellow) {
                // Action
                viewModel.logOut()
            }
            .frame(width: UIScreen.main.bounds.width * 0.9, height: 85)
            .padding(.bottom, 50)

        
    }
}

#Preview {
    ProfileView()
}
