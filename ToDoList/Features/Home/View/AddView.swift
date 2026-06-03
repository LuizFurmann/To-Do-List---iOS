//
//  AddView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    
    @State var alertMessage: String = ""
    @State var showAltert: Bool = false
    @State private var isLoading = false
    @State private var showToast = false
    @State private var toastMessage = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Title", text: $titleText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)

                TextField("Description", text: $descriptionText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveItem,
                       label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
        }
        .overlay(
            VStack {
                
                if showToast {
                    
                    HStack {
                        
                        Image(systemName: "checkmark.circle.fill")
                        
                        Text(toastMessage)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .transition(.move(edge: .top).combined(with: .opacity))
                }
                
                Spacer()
            }
            .padding(.top, 20)
        )
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAltert, content: getAlert)
    }
    
    func saveItem() {

        guard validateField() else {
            return
        }

        guard let userId = AuthService.shared.currentUserId else {

            alertMessage = "Usuário não autenticado"
            showAltert = true
            return
        }

        Task {
            do {
                isLoading = true

                try await TaskService.shared.createTask(
                    title: titleText,
                    description: descriptionText,
                    userId: userId
                )
                
                toastMessage = "Tarefa criada com sucesso!"
                showToast = true

                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    presentationMode.wrappedValue.dismiss()
                }
            } catch {
                alertMessage = error.localizedDescription
                showAltert = true
            }
            isLoading = false
        }
    }
    
    func validateField() -> Bool {
        if titleText.trimmingCharacters(in: .whitespaces).count < 3 {

            alertMessage = "Título deve ter no mínimo 3 caracteres"
            showAltert = true
            return false
        }

        if descriptionText.trimmingCharacters(in: .whitespaces).count < 3 {

            alertMessage = "Descrição deve ter no mínimo 3 caracteres"
            showAltert = true
            return false
        }

        return true
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertMessage))
    }
}

#Preview {
    NavigationView {
        AddView()
    }
    .preferredColorScheme(.light)
    .environmentObject(ListViewModel())
}

#Preview {
    NavigationView {
        AddView()
    }
    .preferredColorScheme(.dark)
    .environmentObject(ListViewModel())
}
