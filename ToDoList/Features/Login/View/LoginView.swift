//
//  LoginView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 20/04/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        NavigationStack {
            
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                backgroundShapes
                
                content
            }
        }
    }
}

extension LoginView {
    private var backgroundShapes: some View {
        VStack {
            HStack {
                TopShapeLogin()
                    .fill(
                        LinearGradient(
                            colors: [
                                Color.orange,
                                Color.pink
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 240, height: 180)
                
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                BottomShapeLogin()
                    .fill(
                        LinearGradient(
                            colors: [Color.cyan, Color.blue],
                            startPoint: .topLeading,
                            endPoint: .topTrailing
                        )
                    )
                    .frame(width: 240, height: 180)
            }
        }
        .ignoresSafeArea()
    }
    
    private var content: some View {
        VStack {
            Spacer()
            
            Text("Login")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 50)
            
            VStack(spacing: 18) {
                customTextField(
                    icon: "person",
                    placeholder: "Username",
                    text: $email
                )
                
                customTextField(
                    icon: "lock",
                    placeholder: "Password",
                    text: $password
                )
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 40)
            
            HStack {
                Spacer()
                
                NavigationLink {
                    ListView()
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(width: 62, height: 62)
                        .background(
                            LinearGradient(
                                colors: [Color.green, Color.cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(Circle())
                        .shadow(color: .cyan.opacity(0.4) , radius: 10, x: 0, y: 5)
                }
                .offset(y: -30)
            }
            .padding(.horizontal, 45)
            
            HStack {
                Text("Register")
                    .foregroundColor(.orange)
                    .fontWeight(.medium)
                
                Spacer()
                
                Text("Forgot?")
                    .foregroundColor(.gray.opacity(0.7))
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
    }
    
    
    private func customTextField(
        icon: String,
        placeholder: String,
        text: Binding<String>
    ) -> some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .foregroundColor(.gray.opacity(0.6))

            TextField(
                placeholder,
                text: text
            )
        }
        .padding()
        .background(Color.gray.opacity(0.06))
        .cornerRadius(20)
    }

    private func customSecureField(
        icon: String,
        placeholder: String,
        text: Binding<String>
    ) -> some View {

        HStack(spacing: 15) {

            Image(systemName: icon)
                .foregroundColor(.gray.opacity(0.6))

            SecureField(
                placeholder,
                text: text
            )
        }
        .padding()
        .background(Color.gray.opacity(0.06))
        .cornerRadius(20)
    }
}

#Preview {
    LoginView()
}
