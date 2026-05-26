//
//  AuthService.swift
//  ToDoList
//
//  Created by Luiz Furmann on 26/05/26.
//

import Foundation
import FirebaseAuth

final class AuthService {
    
    static let shared = AuthService()
    
    private init() {}
    
    func register(
        email: String,
        password: String
    ) async throws {
        try await Auth.auth().createUser(
            withEmail: email,
            password: password
        )
    }
    
    func login(
        email: String,
        password: String
    ) async throws {
        try await Auth.auth().signIn(
            withEmail: email,
            password: password
        )
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    var currentUserId: String? {
        Auth.auth().currentUser?.uid
    }
    
    var isUserLogged: Bool {
        Auth.auth().currentUser != nil
    }
}
