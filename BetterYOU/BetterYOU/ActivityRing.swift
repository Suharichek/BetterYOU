//
//  ActivityRing.swift
//  BetterYOU
//
//  Created by Сухарик on 22.11.2024.
//

import SwiftUI

struct ActivityRing: View {
    var progress: Double
    var ringColor: Color
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundStyle(ringColor)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                .foregroundStyle(ringColor)
                .rotationEffect(.degrees(270.0))
                .animation(.linear(duration: 0.5), value: progress)
            Text(String(format: "%.0f%%", progress * 100.0))
                .font(.largeTitle)
                .bold()
                .foregroundStyle(ringColor)
        }
    }
}

#Preview {
    ActivityRing(progress: 100, ringColor: .red)
}




