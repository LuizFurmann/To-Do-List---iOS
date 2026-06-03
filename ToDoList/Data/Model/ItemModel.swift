//
//  ItemModel.swift
//  ToDoList
//
//  Created by Luiz Furmann on 12/04/26.
//

import Foundation

struct ItemModel: Identifiable, Codable {

    let id: String
    let title: String
    let description: String
    let image: String
    let userId: String
    
    init(
        id: String = UUID().uuidString,
        title: String,
        description: String = "",
        image: String = "",
        userId: String
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.image = image
        self.userId = userId
    }
}
