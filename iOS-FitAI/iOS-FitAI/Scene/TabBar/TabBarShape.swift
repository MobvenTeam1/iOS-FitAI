//
//  TabBarShapeView.swift
//  GrupProjeDeneme
//
//  Created by Ahmet Yasin Atakan on 30.05.2024.
//

import SwiftUI

struct TabBarShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let centerWidth = rect.width / 2
        let curveHeight: CGFloat = 55
        let curveWidth: CGFloat = 45
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: centerWidth - curveWidth / 2 - 20, y: 0))
        
        path.addCurve(to: CGPoint(x: centerWidth + curveWidth / 2 + 20, y: 0),
                      control1: CGPoint(x: centerWidth - 40, y: curveHeight),
                      control2: CGPoint(x: centerWidth + 40, y: curveHeight))
        
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    TabBarShape()
}
