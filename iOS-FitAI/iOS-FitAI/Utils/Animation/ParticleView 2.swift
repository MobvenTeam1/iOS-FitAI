//
//  ParticleView.swift
//  iOS-FitAI
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct ParticleView: View {
    var image: Image
    @State private var randomX: CGFloat = 0
    @State private var randomY: CGFloat = 0
    @State private var opacity: Double = 1

    var body: some View {
        image
            .resizable()
            .frame(width: 10, height: 10)
            .opacity(opacity)
            .onAppear { // It gives random offsets to the particles.
                self.randomX = CGFloat.random(in: -300...300)
                self.randomY = CGFloat.random(in: -300...350)
                self.opacity = 0
            }
            .offset(x: randomX, y: randomY)
    }
}

#Preview {
    ParticleEmitterView(particles: 100, duration: 2, image: Image("starforanimation"))
}
