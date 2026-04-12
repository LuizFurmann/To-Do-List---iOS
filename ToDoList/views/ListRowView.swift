//
//  ListRowView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" :
            "circle")
            .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview {
    var item1 = ItemModel(title: "teste2026", isCompleted: true)
    var item2 = ItemModel(title: "teste", isCompleted: false)
    
    Group {
        ListRowView(item: item1)
    }
    .previewLayout(.sizeThatFits)
}
