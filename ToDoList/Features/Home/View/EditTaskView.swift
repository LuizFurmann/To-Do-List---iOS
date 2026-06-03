//
//  EditTaskView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 03/06/26.
//

import SwiftUI

struct EditTaskView: View {

    let item: ItemModel

    @Environment(\.dismiss) private var dismiss

    @State private var title: String
    @State private var description: String
    @State private var isLoading = false
    @State private var showAlert = false
    @State private var alertMessage = ""

    init(item: ItemModel) {
        self.item = item

        _title = State(initialValue: item.title)
        _description = State(initialValue: item.description)
    }

    var body: some View {

        ScrollView {
            VStack(spacing: 16) {

                TextField("Title", text: $title)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)

                TextEditor(text: $description)
                    .frame(height: 150)
                    .padding(4)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(12)

                Button {
                    saveChanges()
                } label: {
                    Text("Salvar")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .cornerRadius(12)
                }
            }
            .padding()
        }
        .navigationTitle("Editar")
        .alert(alertMessage, isPresented: $showAlert) {
            Button("OK") { }
        }
    }
    
    func saveChanges() {
        guard title.trimmingCharacters(in: .whitespaces).count >= 3 else {
            alertMessage = "Título inválido"
            showAlert = true
            return
        }

        guard description.trimmingCharacters(in: .whitespaces).count >= 3 else {
            alertMessage = "Descrição inválida"
            showAlert = true
            return
        }

        Task {
            do {
                isLoading = true

                try await TaskService.shared.updateTask(
                    taskId: item.id,
                    title: title,
                    description: description
                )
                dismiss()
            } catch {
                alertMessage = error.localizedDescription
                showAlert = true
            }

            isLoading = false
        }
    }
}
