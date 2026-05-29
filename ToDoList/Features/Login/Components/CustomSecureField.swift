//
//  CustomSecureField.swift
//  ToDoList
//
//  Created by Luiz Furmann on 27/05/26.
//

import SwiftUI

struct CustomSecureField: View {
    
    let icon: String
    let placeholder: String
    
    @Binding var text: String
    @State private var isSecure = true
    
    var body: some View {
        
        HStack(spacing: 15) {
            Image(systemName: icon)
                .foregroundColor(.gray.opacity(0.6))
            
            Group {
                if isSecure {
                    SecureField(
                        placeholder,
                        text: $text
                    )
                } else {
                    TextField(
                        placeholder,
                        text: $text
                    )
                }
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            
            Button {
                isSecure.toggle()
            } label: {
                Image(
                    systemName: isSecure ? "eye.slash" : "eye"
                )
                .foregroundColor(.gray.opacity(0.6))
            }
        }
        .padding()
        .background(Color.gray.opacity(0.06))
        .cornerRadius(20)
    }
}
