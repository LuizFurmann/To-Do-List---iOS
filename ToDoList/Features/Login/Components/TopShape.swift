//
//  TopShape.swift
//  ToDoList
//
//  Created by Luiz Furmann on 25/05/26.
//

import SwiftUI

struct TopShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: .zero)
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        
        path.addLine(to: CGPoint(x: rect.width, y: rect.height * 0.35))
        
        path.addQuadCurve(
            to: CGPoint(x: 0, y: rect.height),
            control: CGPoint(
                x: rect.width * 0.75,
                y: rect.height * 0.95
            )
        )

        return path
    }
}

#Preview {
    TopShape()
}
