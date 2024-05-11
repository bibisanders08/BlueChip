//
//  TabMainView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct TabMainView: View {
    
    @State private var isTabBarShown = true
    @State private var actibeTab: Tab = .home
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                TabView(selection: $actibeTab) {
                    MainView() {
                        isTabBarShown.toggle()
                    }
                        .tag(Tab.home)
                        .modifier(HideTabBar())
                    
                    StatisticView()
                        .tag(Tab.stat)
                        .modifier(HideTabBar())
                    
                    PercentView()
                        .tag(Tab.percent)
                        .modifier(HideTabBar())
                    
                    SettingsView()
                        .tag(Tab.settings)
                        .modifier(HideTabBar())
                }
                
                
            }
            .overlay {
                if isTabBarShown {
                    VStack {
                        Spacer()
                        
                        
                        TabBarView(tab: $actibeTab)
                            .padding(.horizontal)
                    }
                }
              
            }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "initial") {
                UserDefaults.standard.setValue(true, forKey: "initial")
                StorageManager.shared.createNewWalet(name: "Main")
            }
        }
    }
}

#Preview {
    TabMainView()
        .preferredColorScheme(.light)
}
