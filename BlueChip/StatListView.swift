//
//  StatListView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct StatListView: View {
    
    var transactions: [WalletTransaction]
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(.darkBlue)
                .cornerRadius(12, corners: [.topLeft, .topRight])
                .shadow(color: .darkBlue, radius: 10)
                .glow(.lightPink.opacity(0.5), radius: 30)
                .overlay {
                    ScrollView {
                        VStack {
                            ForEach(transactions.reversed(), id: \.self) { tr in
                                NavigationLink {
                                    StatDetailView(transaction: tr)
                                } label: {
                                    StatRowView(stat: tr)
                                        .padding(.horizontal)
                                }

                            }
                            .padding(.top, 10)
                            
                            VStack {
                                
                            }
                            .frame(height: 200)
                        }
                    }
                    .padding(.top)
                    .padding(.bottom, 60)
                }
            
        }
        .ignoresSafeArea()
    }
}

//#Preview {
//    StatListView()
//}
