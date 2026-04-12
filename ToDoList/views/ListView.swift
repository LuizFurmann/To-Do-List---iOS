//
//  ListView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct ListView: View {
    
    @State var items: [ItemModel] = [
        ItemModel(title: "Engenharia de Software",isCompleted: true),
        ItemModel(title: "Android ", isCompleted: true),
        ItemModel(title: "iOS", isCompleted: false)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
              ListRowView(item: item)
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: Text("Destination"))
        )
        
    }
}

#Preview {
    NavigationView {
        ListView()
    }
}
