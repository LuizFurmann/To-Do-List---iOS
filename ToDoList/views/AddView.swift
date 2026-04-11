//
//  AddView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieltText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieltText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.9062772393, green: 0.9062772393, blue: 0.9062772393, alpha: 1)))
                    .cornerRadius(10)
                
                Button(action: { },
                       label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an item 🖋️")
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    
}
