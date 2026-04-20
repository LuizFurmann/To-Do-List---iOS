//
//  LoginView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 20/04/26.
//

import SwiftUI

struct LoginView: View {
    @State var textFieldText: String = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
        GeometryReader { geometry in
            
            ZStack {
                Image("login_background")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width)
                    .clipped()
                    .ignoresSafeArea()
                
                ScrollView {
                    
                        VStack {
                            Spacer().frame(height: 450)
                            
                            VStack(spacing: 12) {
                                
                                
                                Text("Login to controll your task")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.bottom, 20)
                                
                                
                                HStack {
                                    Image(systemName: "envelope")
                                        .foregroundColor(.gray)
                                    
                                    TextField("Email", text: $textFieldText)
                                }
                                
                                .padding(.horizontal)
                                .frame(height: 55)
                                .background(Color(UIColor.secondarySystemBackground))
                                .cornerRadius(10)
                                
                                
                                HStack {
                                    Image(systemName: "lock")
                                        .foregroundColor(.gray)
                                    SecureField("Password", text: $textFieldText)
                                }
                                .padding(.horizontal)
                                .frame(height: 55)
                                .background(Color(UIColor.secondarySystemBackground))
                                .cornerRadius(10)
                                .padding(.bottom, 20)
                                
                                Button(action: login,
                                       label: {
                                    Text("Login")
                                        .foregroundColor(.white)
                                        .font(.headline)
                                        .frame(maxWidth: .infinity)
                                        .frame(height: 55)
                                        .background(Color.accentColor)
                                        .cornerRadius(20)
                                        .padding(.horizontal, 30)
                                })
                            }
                            .padding(.horizontal, 20)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .frame(minHeight: geometry.size.height)
                    }
                    .navigationDestination(isPresented: $isLoggedIn) {
                        ListView()
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    
    func login() {
        isLoggedIn = true
    }
}

#Preview {
    
}
