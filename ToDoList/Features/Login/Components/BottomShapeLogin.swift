//
//  BottomShape.swift
//  ToDoList
//
//  Created by Luiz Furmann on 25/05/26.
//

import SwiftUI

struct BottomShapeLogin: Shape {

    func path(in rect: CGRect) -> Path {

        var path = Path()

        path.move(
            to: CGPoint(x: 0, y: rect.height)
        )

        path.addLine(
            to: CGPoint(x: rect.width, y: rect.height)
        )

        path.addLine(
            to: CGPoint(x: rect.width, y: rect.height * 0.55)
        )

        path.addQuadCurve(
            to: CGPoint(x: 0, y: 0),
            control: CGPoint(
                x: rect.width * 0.25,
                y: rect.height * 0.1
            )
        )

        return path
    }
}

#Preview {
    BottomShapeLogin()
}
