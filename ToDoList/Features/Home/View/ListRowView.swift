//
//  ListRowView.swift
//  ToDoList
//
//  Created by Luiz Furmann on 11/04/26.
//

import SwiftUI

struct ListRowView: View {

    let item: ItemModel

    var body: some View {

        HStack(alignment: .top, spacing: 15) {

            Image(systemName: "note.text")
                .font(.title2)
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .pink],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

            VStack(alignment: .leading, spacing: 4) {

                Text(item.title)
                    .font(.headline)

                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(18)
        .shadow(
            color: .black.opacity(0.05),
            radius: 4,
            x: 0,
            y: 2
        )
        .padding(.horizontal, 4)
        .padding(.vertical, 4)

    }
}


#Preview {

}
