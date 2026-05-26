//
//  ListView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    let userId: String
    
    var body: some View {

        ZStack {
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Usuário logado")

            Text(userId)
                .font(.caption)
                .foregroundColor(.gray)
                .padding()
            
            if(listViewModel.items.isEmpty) {
                NoItemsView()
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                      ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView {
        ListView(userId: "123")
    }
    .environmentObject(ListViewModel())
}
