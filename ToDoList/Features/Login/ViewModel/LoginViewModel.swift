//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Luiz Furmann on 20/05/26.
//

import SwiftUI
import Combine

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    func login() async {
        
        do {
            
            isLoading = true
            
            try await AuthService.shared.login(
                email: email,
                password: password
            )
            
        } catch {
            
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
}
