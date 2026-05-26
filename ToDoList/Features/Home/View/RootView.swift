//
//  Untitled.swift
//  ToDoList
//
//  Created by Luiz Furmann on 20/04/26.
//

import SwiftUI

struct RootView: View {
    
    @StateObject private var sessionManager = SessionManager()
    
    var body: some View {

        if sessionManager.isLoggedIn {
            ListView(
                userId: sessionManager.userId
            )
        } else {
            LoginView()
        }
    }
}
