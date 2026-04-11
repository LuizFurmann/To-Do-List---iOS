//
//  ListRowView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct ListRowView: View {
    
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.circle")
            Text(title)
            Spacer()
        }
    }
}


#Preview {
    ListRowView(title: "This is the first title")
}
