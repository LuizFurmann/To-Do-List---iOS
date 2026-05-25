//
//  RegisterView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 25/05/26.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            backgroundShapes
            
            content
        }

    }
}

extension RegisterView {
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
            
            Text("Criar uma conta")
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 50)
            
            VStack(spacing: 18) {
                customTextField(
                    icon: "person",
                    placeholder: "Nome",
                    text: $email
                )
                
                customTextField(
                    icon: "envelope",
                    placeholder: "E-mail",
                    text: $email
                )
                
                customSecureField(
                    icon: "lock",
                    placeholder: "Digite uma senha",
                    text: $password
                )

                customSecureField(
                    icon: "lock",
                    placeholder: "Confirme sua senha",
                    text: $password
                )
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 40)
            
            HStack {
                Spacer()
                
                Button {
                    
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
            
            HStack(spacing: 4) {

                Text("Already have an account?")
                    .foregroundColor(.gray)

                Text("Login")
                    .foregroundColor(.orange)
                    .fontWeight(.semibold)
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
    RegisterView()
}
