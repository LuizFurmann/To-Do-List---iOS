//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Luiz Furmann on 12/04/26.
//

import Foundation
import SwiftUI
import Combine

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    
    let itemsKey: String = "items_list"
    

    
    @MainActor
    func loadTasks(userId: String) async {

        do {

            items = try await TaskService.shared.getTasks(
                userId: userId
            )

        } catch {

            print(error.localizedDescription)
        }
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(
        title: String,
        description: String,
        userId: String
    ) {

        let newItem = ItemModel(
            title: title,
            description: description,
            image: "",
            userId: userId
        )

        items.append(newItem)
    }
    
    
    func saveItems() {
        if let encodeData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodeData, forKey: itemsKey)
        }
    }
}
