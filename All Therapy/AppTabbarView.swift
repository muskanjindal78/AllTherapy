//
//  ContentView.swift
//  All Therapy
//
//  Created by Muskan Jindal on 09/02/23.
//

import SwiftUI

struct AppTabbarView: View {
    
    @SwiftUI.State var selectedIndex = 3
    @SwiftUI.State var showDrawer = false
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance.init(idiom: .unspecified)
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.white.withAlphaComponent(0.7)
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = UIColor(Color.BackgroundColor)
    }
    var body: some View {
        NavigationView {
            ZStack {
                TabView(selection: $selectedIndex) {
                    HomeView(showDrawer: $showDrawer)
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(1)
                    CalendarView(showDrawer: $showDrawer)
                        .tabItem {
                            Image(systemName: "calendar")
                        }
                        .tag(2)
                    SearchView(showDrawer: $showDrawer)
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .tag(3)
                    ToDoView(showDrawer: $showDrawer)
                        .tabItem {
                            Image(systemName: "list.clipboard")
                        }
                        .tag(4)
                    ProfileView(showDrawer: $showDrawer)
                        .tabItem {
                            Image(systemName: "person")
                        }
                        .tag(5)
                }
                if showDrawer {
                    ZStack {
                        Color.black.opacity(0.3)
                            .onTapGesture {
                                showDrawer = false
                            }
                        HStack {
                            VStack {
                                Spacer()
                                Text("Menu")
                                    .foregroundColor(.white)
                                Spacer()
                            }
                            .frame(width: (UIScreen.main.bounds.width * 2) / 3,height: UIScreen.main.bounds.height)
                            .background(Color.BackgroundColor)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
