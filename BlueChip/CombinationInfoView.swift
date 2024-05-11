//
//  CombinationInfoView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//


import SwiftUI

struct CombinationsInfoView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        InfoCard(header: "High Card", text: InfoManager.shared.highCard)
                        
                        InfoCard(header: "One Pair", text: InfoManager.shared.onePair)
                        
                        InfoCard(header: "Two Pair", text: InfoManager.shared.twoPair)
                        
                        InfoCard(header: "Three if a Kind", text: InfoManager.shared.threeOfAKind)
                        
                        InfoCard(header: "Straight", text: InfoManager.shared.straight)
                        
                        InfoCard(header: "Flush", text: InfoManager.shared.flush)
                        
                        InfoCard(header: "Full House", text: InfoManager.shared.fullHouse)
                        
                        InfoCard(header: "Four of a Kind", text: InfoManager.shared.fourOfAKind)
                        
                        InfoCard(header: "Straight Flush", text: InfoManager.shared.straightFlush)
                        
                        InfoCard(header: "Royal Flush", text: InfoManager.shared.royalFlush)
                    }
                }
                .padding(.top)
                .hideScrollIndicator()
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        VStack {
                            HStack(spacing: 10) {
                               
                                Text("Combination Info")
                                    .font(.system(size: 28, weight: .black))
                                    .foregroundColor(Color.white)
                                
                                Spacer()
                                
                                Button {
                                    dismiss()
                                } label: {
                                    Image(systemName: "xmark")
                                }
                                .foregroundColor(.white)
                            }
                            
                        }
                        Spacer()
                    }
                    .ignoresSafeArea()
                }
            }
        }
    }
}

#Preview {
    CombinationsInfoView()
}


struct InfoCard: View {
    
    var header: String
    var text: String
    
    var body: some View {
        VStack {
            DividerView()
            
            Text(header)
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical)
            
            
            Text(text)
        }
        .foregroundColor(.white)
        .padding(.horizontal)
    }
}
