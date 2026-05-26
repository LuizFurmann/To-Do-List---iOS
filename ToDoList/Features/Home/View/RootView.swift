//
//  Untitled.swift
//  ToDoList
//
//  Created by Luiz Furmann on 20/04/26.
//

import SwiftUI

struct RootView: View {
    
    var body: some View {

        if AuthService.shared.isUserLogged {
            ListView(
                userId: AuthService.shared.currentUserId ?? ""
            )

        } else {

            LoginView()
        }
    }
}
