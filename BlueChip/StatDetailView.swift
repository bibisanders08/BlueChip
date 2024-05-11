//
//  StatDetailView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct StatDetailView: View {
    
    var transaction: WalletTransaction
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                ScrollView {
                    VStack {
                        Text("Detail")
                            .font(.system(size: 32, weight: .black))
                            .foregroundColor(.white)
                        
                        if let data = transaction.imageData, let image = UIImage(data: data) {
                            
                            DividerView()
                                .padding(.vertical)
                            
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                        }
                        
                        DividerView()
                            .padding(.vertical)
                        
                        HStack {
                            Text(transaction.type)
                            Text("\(String(format: "%.2f", transaction.value))")
                        }
                        .font(.system(size: 22))
                        .foregroundColor(.white)
                        
                        DividerView()
                            .padding(.vertical)
                        
                        Text(transaction.date)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                        
                        DividerView()
                            .padding(.vertical)
                        
                        Text(transaction.note)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        VStack {
                            
                        }
                        .frame(height: 100)
                    }
                }
                .hideScrollIndicator()
            }
        }
        .modifier(HideTabBar())
    }
}

#Preview {
    StatDetailView(transaction: .example)
}
