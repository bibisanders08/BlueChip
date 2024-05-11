//
//  StatRowView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct StatRowView: View {
    
    let stat: WalletTransaction
    
    var body: some View {
        Rectangle()
           // .fill(LinearGradient(colors: [.semiBlue, .black], startPoint: .topLeading, endPoint: .trailing))
            .foregroundColor(.darkBlue)
            .frame(width: screenSize().width - 40, height: 70)
            .cornerRadius(12)
            .opacity(0.7)
            .shadow(color: .lightBlue, radius: 2)
          //  .glow(.lightBlue, radius: 1)
            .overlay {
                HStack {
                    Text(stat.date)
                    
                    Spacer()
                    
                    Text(stat.type)
                    
                    Text("\(String(format: "%.2f", stat.value))")
                }
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.horizontal)
            }
            
        
    }
}

#Preview {
    StatRowView(stat: .example)
}
