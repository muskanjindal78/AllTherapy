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
    var drawerContent: ( ()->() ) = {}
    
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
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(1)
                    CalendarView()
                        .tabItem {
                            Image(systemName: "calendar")
                        }
                        .tag(2)
                    SearchView()
                        .tabItem {
                            Image(systemName: "magnifyingglass")
                        }
                        .tag(3)
                    ToDoView()
                        .tabItem {
                            Image(systemName: "list.clipboard")
                        }
                        .tag(4)
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person")
                        }
                        .tag(5)
                }
            }
        }
    }
}
