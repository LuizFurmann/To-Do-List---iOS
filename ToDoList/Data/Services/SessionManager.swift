//
//  SessionManager.swift
//  ToDoList
//
//  Created by Luiz Furmann on 26/05/26.
//

import SwiftUI
import FirebaseAuth
import Combine

@MainActor
final class SessionManager: ObservableObject {
    
    @Published var isLoggedIn = false
    @Published var userId: String = ""
    
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
        setupAuthListener()
    }
    
    private func setupAuthListener() {
        authStateHandler = Auth.auth().addStateDidChangeListener {
            [weak self] _, user in
            
            self?.isLoggedIn = user != nil
            self?.userId = user?.uid ?? ""
        }
    }
}
