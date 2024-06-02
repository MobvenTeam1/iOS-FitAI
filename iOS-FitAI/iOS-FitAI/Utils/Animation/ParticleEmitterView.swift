//
//  ParticleEmitterView.swift
//  FitAI-Project
//
//  Created by Ahmet Yasin Atakan on 2.06.2024.
//

import SwiftUI

struct ParticleEmitterView: View {
    let particles: Int
    let duration: Double
    let image: Image

    var body: some View {
        ZStack {
            ForEach(0..<particles, id: \.self) { _ in
                ParticleView(image: image)
                    .animation(
                        Animation.easeOut(duration: duration)
                            .repeatCount(1, autoreverses: false)
                    )
            }
        }
    }
}

#Preview {
    ParticleEmitterView(particles: 500, duration: 2, image: Image("starforanimation"))
}
