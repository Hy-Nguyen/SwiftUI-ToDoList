//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Hy Nguyen on 12/21/23.
//

import SwiftUI
import FirebaseFirestore


struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userID: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userID)/tasks"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(
                userID: userID
            )
        )
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ListItemView(item: item)
                        .swipeActions{
                            Button {
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete")
                                    
                            }
                        }
                        .tint(.red)
                }
                .listStyle(PlainListStyle())
                .padding(.vertical, 10)
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                // code
                CreateItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userID: "Ueh2G9hEwdUNp33wwJjk0bNSZnk1")
}
