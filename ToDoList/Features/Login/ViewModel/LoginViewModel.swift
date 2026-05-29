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
    
    @Published var emailError = ""
    @Published var passwordError = ""
    
    @Published var isLoading = false
    @Published var errorMessage = ""
    
    func login() async {
        
        guard validateFields() else {
            return
        }
        
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
    
    private func validateFields() -> Bool {
        emailError = ""
        passwordError = ""
        
        var isValid = true
        
        if email.trimmingCharacters(in: .whitespaces).isEmpty {
            emailError = "Campo obrigatório"
            isValid = false
        }
        
        if password.trimmingCharacters(in: .whitespaces).isEmpty {
            passwordError = "Campo obrigatório"
            isValid = false
        }
        
        return isValid
    }
}
