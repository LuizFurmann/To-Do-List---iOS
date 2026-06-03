//
//  TaskService.swift
//  ToDoList
//
//  Created by Luiz Furmann on 03/06/26.
//

import Foundation
import FirebaseFirestore

final class TaskService {

    static let shared = TaskService()

    private let db = Firestore.firestore()

    private init() { }

    func createTask(
        title: String,
        description: String,
        userId: String
    ) async throws {

        let task = ItemModel(
            title: title,
            description: description,
            image: "",
            userId: userId
        )

        try await db
            .collection("Tasks")
            .document(task.id)
            .setData([
                "id": task.id,
                "title": task.title,
                "description": task.description,
                "image": task.image,
                "userId": task.userId
            ])
    }
    
    func getTasks(userId: String) async throws -> [ItemModel] {

        let snapshot = try await db
            .collection("Tasks")
            .whereField("userId", isEqualTo: userId)
            .getDocuments()

        return snapshot.documents.compactMap { document in

            let data = document.data()

            guard
                let id = data["id"] as? String,
                let title = data["title"] as? String,
                let description = data["description"] as? String,
                let image = data["image"] as? String,
                let userId = data["userId"] as? String
            else {
                return nil
            }

            return ItemModel(
                id: id,
                title: title,
                description: description,
                image: image,
                userId: userId
            )
        }
    }
}
