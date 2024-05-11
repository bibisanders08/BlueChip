//
//  TipsView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct TipsView: View {
    
    var completion: () -> ()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onAppear {
                        completion()
                    }
                
                ScrollView {
                    VStack {
                        
                        Text("Texas Hold'em Rules")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(Color.white)
                        
                        RulesDetailView(header: InfoManager.shared.t1, text: InfoManager.shared.t1Info)
                        RulesDetailView(header: InfoManager.shared.t2, text: InfoManager.shared.t2Info)
                        RulesDetailView(header: InfoManager.shared.t3, text: InfoManager.shared.t3Info)
                        RulesDetailView(header: InfoManager.shared.t4, text: InfoManager.shared.t4Info)
                        RulesDetailView(header: InfoManager.shared.t5, text: InfoManager.shared.t5Info)
                        RulesDetailView(header: InfoManager.shared.t6, text: InfoManager.shared.t6Info)
                        RulesDetailView(header: InfoManager.shared.t7, text: InfoManager.shared.t7Info)
                        RulesDetailView(header: InfoManager.shared.t8, text: InfoManager.shared.t8Info)
                        RulesDetailView(header: InfoManager.shared.t9, text: InfoManager.shared.t9Info)
                        RulesDetailView(header: InfoManager.shared.t10, text: InfoManager.shared.t10Info)
                        
                    }
                }
                .padding(.top)
                .hideScrollIndicator()
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    TipsView(){}
}
