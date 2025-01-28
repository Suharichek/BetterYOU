//
//  HomeView.swift
//  BetterYOU
//
//  Created by Сухарик on 19.01.2025.
//

import SwiftUI

enum TabItem: String, CaseIterable {
    case sleep = "bed.double.fill"
    case work = "figure.run"
    case eat = "fork.knife"
    case profile = "person.fill"
}

struct HomeView: View {
    @State var selectedTab: TabItem = .sleep
    
    var body: some View {
        ZStack {
            VStack {
                switch selectedTab {
                case .sleep:
                    BetterSleep()
                    
                case .work:
                    BetterWork()
                    
                case .eat:
                    BetterEat()
                    
                case .profile:
                    ProfileView()
                    
                }
            }
            CustomTabBar(selectedTab: $selectedTab)
        }
    }
}

struct CustomTabBar: View {
    @Binding var selectedTab: TabItem
    
    @Namespace private var animation
    
    let tabItems: [TabItem] = TabItem.allCases
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabItems, id: \.self) { item in
                GeometryReader { proxy in
                    Button {
                        //withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                            selectedTab = item
                        //} ненужный переход
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: item.rawValue)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(selectedTab == item ? .white : .gray)
                                .frame(width: proxy.size.width, height: 40)
                                .background(
                                    ZStack {
                                        if selectedTab == item {
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color.accentColor.opacity(0.8))
                                                .matchedGeometryEffect(id: "TAB_BACKGROUND", in: animation)
                                                .shadow(radius: 8, x: 0, y: 4)
                                        }
                                    }
                                )
                        }
                        .frame(height: 40)
                    }
                    .frame(width: proxy.size.width, height: 50)
                }
                .frame(height: 50)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 10)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 4)
        .padding(.horizontal, 16)
        .padding(.top, 700)
    }
}

#Preview {
    HomeView()
}

//import SwiftUI
//
//struct HomeView: View {
//    var body: some View {
//        TabView {
//            BetterSleep()
//                .tabItem {
//                    Image(systemName: "bed.double.fill")
//                    Text("Sleep")
//                }
//
//            BetterWork()
//                .tabItem {
//                    Image(systemName: "figure.run")
//                    Text("Work")
//                }
//
//            BetterEat()
//                .tabItem {
//                    Image(systemName: "fork.knife")
//                    Text("Food")
//                }
//
//            ProfileView()
//                .tabItem {
//                    Image(systemName: "person.fill")
//                    Text("Profile")
//                }
//        }
//    }
//}
//
//#Preview {
//    HomeView()
//}
