//
//  ItemModel.swift
//  ToDoList
//
//  Created by Luiz Furmann on 12/04/26.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
