//
//  ListView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    let userId: String
    
    var body: some View {

        NavigationStack {

            ZStack {

                Color(.systemGroupedBackground)
                    .ignoresSafeArea()

                VStack(spacing: 0) {

                    headerSection

                    if listViewModel.items.isEmpty {

                        Spacer()

                        NoItemsView()

                        Spacer()

                    } else {

                        List {

                            ForEach(listViewModel.items) { item in

                                ListRowView(item: item)
                                    .listRowSeparator(.hidden)
                                    .listRowBackground(Color.clear)
                                    .onTapGesture {

                                        withAnimation(.linear) {

                                            listViewModel.updateItem(item: item)
                                        }
                                    }
                            }
                            .onDelete(perform: listViewModel.deleteItem)
                            .onMove(perform: listViewModel.moveItem)
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                    }
                }

                floatingButton
            }
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    EditButton()
                }

                ToolbarItem(placement: .topBarTrailing) {

                    Button {

                        do {

                            try AuthService.shared.logout()

                        } catch {

                            print(error.localizedDescription)
                        }

                    } label: {

                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var headerSection: some View {

        VStack(alignment: .leading, spacing: 12) {

            Text("Olá 👋")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text("Minhas tarefas")
                .font(.largeTitle)
                .fontWeight(.bold)

            HStack {

                VStack(alignment: .leading, spacing: 6) {

                    Text("Total de tarefas")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))

                    Text("\(listViewModel.items.count)")
                        .font(.system(size: 34, weight: .bold))
                        .foregroundColor(.white)
                }

                Spacer()

                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.white.opacity(0.9))
            }
            .padding()
            .background(
                LinearGradient(
                    colors: [.orange, .pink],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            )
            .cornerRadius(24)
        }
        .padding()
    }
    
    private var floatingButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink {
                    AddView()
                } label: {
                    Image(systemName: "plus")
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .frame(width: 65, height: 65)
                        .background(
                            LinearGradient(
                                colors: [.green, .cyan],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .clipShape(Circle())
                        .shadow(
                            color: .cyan.opacity(0.4),
                            radius: 10,
                            x: 0,
                            y: 5
                        )
                }
            }
            .padding()
        }
    }
}

#Preview {
    NavigationView {
        ListView(userId: "123")
    }
    .environmentObject(ListViewModel())
}
