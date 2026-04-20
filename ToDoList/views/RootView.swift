//
//  Untitled.swift
//  ToDoList
//
//  Created by Luiz Furmann on 20/04/26.
//

import SwiftUI

struct RootView: View {
    
    @State private var isLoggedIn = false
    
    var body: some View {
        if isLoggedIn {
            ListView()
        } else {
            LoginView(isLoggedIn: $isLoggedIn)
        }
    }
}
