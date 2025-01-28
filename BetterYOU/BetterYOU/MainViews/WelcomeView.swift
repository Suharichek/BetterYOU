//
//  WelcomeView.swift
//  BetterYOU
//
//  Created by Сухарик on 19.01.2025.
//

import SwiftUI

struct OnboardingItem: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var image: String
    
    let backgroundGradient: LinearGradient
}

let onboardingItems: [OnboardingItem] = [
    OnboardingItem(title: NSLocalizedString("Perfect Sleep, Perfect Day", comment: ""),
                   description: NSLocalizedString("Learn to fall asleep on time and wake up energized! Our smart algorithm calculates the best sleep schedule to keep you performing at your best every day.", comment: ""),
                   image: "moon.stars.fill",
                   backgroundGradient: LinearGradient(
                    gradient: Gradient(colors: [Color(red: 12/255, green: 38/255, blue: 64/255),
                                                Color(red: 118/255, green: 103/255, blue: 255/255),
                                                Color(red: 157/255, green: 221/255, blue: 255/255)]),
                    startPoint: .top,
                    endPoint: .bottom
                   )
                  ),
    OnboardingItem(title: NSLocalizedString("Every Step Counts", comment: ""),
                   description: NSLocalizedString("Track your steps, log workouts, and monitor your progress. All in one place — designed to keep you motivated and moving forward!", comment: ""),
                   image: "figure.walk",
                   backgroundGradient: LinearGradient(
                    gradient: Gradient(colors: [Color(red: 205/255, green: 43/255, blue: 43/255),
                                                Color(red: 255/255, green: 116/255, blue: 0/255),
                                                Color(red: 255/255, green: 230/255, blue: 128/255)]),
                    startPoint: .topTrailing,
                    endPoint: .bottomLeading
                   )
                  ),
    OnboardingItem(title: NSLocalizedString("Calories Under Control", comment: ""),
                   description: NSLocalizedString("Easily track your calories and macros (proteins, fats, carbs) to stay in shape. Simplify your nutrition for a healthier lifestyle.", comment: ""),
                   image: "fork.knife",
                   backgroundGradient: LinearGradient(
                    gradient: Gradient(colors: [Color(red: 124/255, green: 212/255, blue: 158/255),
                                                Color(red: 86/255, green: 175/255, blue: 87/255),
                                                Color(red: 163/255, green: 224/255, blue: 91/255)]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                   )
                  ),
    OnboardingItem(title: NSLocalizedString("All for Your Balance", comment: ""),
                   description: NSLocalizedString("BetterYOU is your personal assistant for a better life. Stay balanced with health, nutrition, and activity all in one app. Your best self starts here!", comment: ""),
                   image: "sparkles",
                   backgroundGradient: LinearGradient(
                    gradient: Gradient(colors: [Color(red: 91/255, green: 61/255, blue: 255/255),
                                                Color(red: 255/255, green: 90/255, blue: 136/255),
                                                Color(red: 70/255, green: 204/255, blue: 255/255)]),
                    startPoint: .bottomTrailing,
                    endPoint: .topLeading
                   )
                  ),
]

struct WaveShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addCurve(
            to: CGPoint(x: rect.width * 0.8, y: rect.midY * 0.9),
            control1: CGPoint(x: rect.width * 0.2, y: rect.maxY * 0.7),
            control2: CGPoint(x: rect.width * 0.6, y: rect.midY * 1.1)
        )
        
        path.addCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY),
            control1: CGPoint(x: rect.width * 0.9, y: rect.midY * 0.8),
            control2: CGPoint(x: rect.width * 0.95, y: rect.minY * 1.2)
        )
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.closeSubpath()
        
        return path
    }
}

struct OnboardingPage: View {
    let item: OnboardingItem
    
    @State private var iconScale: CGFloat = 1
    
    var body: some View {
        ZStack {
            item.backgroundGradient
                .ignoresSafeArea()
            
            VStack {
                WaveShape()
                    .fill(Color.white.opacity(0.15))
                    .frame(height: 250)
                    .rotationEffect(.degrees(180))
                Spacer()
            }
            
            VStack(spacing: 25) {
                // Icon
                Image(systemName: item.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.25), radius: 6, x: 0, y: 4)
                    .scaleEffect(iconScale)
                    .symbolEffect(.bounce, options: .speed(0.5))
                    .symbolRenderingMode(.hierarchical)
                
                // Title
                Text(item.title)
                    .font(.system(size: 26, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .shadow(color: .black.opacity(0.2), radius: 3, x: 1, y: 1)
                
                // Description
                Text(item.description)
                    .font(.system(size: 16, weight: .medium, design: .rounded))
                    .foregroundColor(.white.opacity(0.85))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: 300)
                    .shadow(color: .black.opacity(0.1), radius: 2, x: 1, y: 1)
            }
            .padding(.bottom, 60)
        }
    }
}

struct OnboardingView: View {
    let items: [OnboardingItem]
    
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    @State private var currentIndex: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $currentIndex) {
                ForEach(items.indices, id: \.self) { index in
                    OnboardingPage(item: items[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
            VStack {
                Spacer()
                
                HStack(spacing: 8) {
                    ForEach(0..<items.count, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 4)
                            .fill(i == currentIndex ? Color.white : Color.white.opacity(0.4))
                            .frame(width: i == currentIndex ? 22 : 8, height: 8)
                            .animation(.spring(), value: currentIndex)
                    }
                }
                .padding(.top, 16)
                
                HStack(spacing: 20) {
                    if currentIndex < items.count - 1 {
                        Button {
                            currentIndex = items.count - 1
                        } label: {
                            Text("Skip")
                                .font(.system(.body, design: .rounded))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.white.opacity(0.7))
                                .cornerRadius(12)
                        }
                    }
                    Button {
                        if currentIndex < items.count - 1 {
                            currentIndex += 1
                        } else {
                            isFirstLaunch = false
                        }
                    } label: {
                        Text(currentIndex < items.count - 1 ? "Next" : "Start!")
                            .font(.system(.body, design: .rounded))
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 10)
                            .background(Color.white.opacity(0.7))
                            .cornerRadius(12)
                    }
                }
                .padding(.bottom, 40)
            }
            .padding(.horizontal, 20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct WelcomeView: View {
    
    var body: some View {
        OnboardingView(items: onboardingItems)
    }
}

#Preview {
    WelcomeView()
}
