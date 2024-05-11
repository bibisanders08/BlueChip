//
//  AllCombinationsView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct AllCombinationsView: View {
    
    
    var completion: () -> ()
    
    let highCard = ["AS", "2S", "7D", "9D", "3H"]
    let onePair = ["AS", "AD", "7C", "9D", "3H"]
    let twoPair = ["AS", "AD", "7D", "7H", "3H"]
    let threeOfAKind = ["AS", "AD", "AC", "7H", "3H"]
    let straight = ["6S", "7D", "8D", "9H", "TH"]
    let flush = ["AC", "AC", "7C", "7C", "3C"]
    let fullHouse = ["AS", "AD", "AH", "9H", "9S"]
    let fourOfAKind = ["AS", "AD", "AH", "AC", "3H"]
    let straightFlush = ["7C", "8C", "9C", "TC", "JC"]
    let royalFlush = ["TH", "JH", "QH", "KH", "AH"]

    @State var isInfoShown = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onAppear {
                        completion()
                    }
                
                ScrollView {
                    VStack {
                        
                        Text("Combinations")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(Color.white)
                        
                        CombinationView(name: "Royal Flush", combination: royalFlush)

                        CombinationView(name: "Straight Flush", combination: straightFlush)

                        CombinationView(name: "Four of a Kind", combination: fourOfAKind)

                        CombinationView(name: "Full House", combination: fullHouse)

                        CombinationView(name: "Flush", combination: flush)

                        CombinationView(name: "Straight", combination: straight)

                        CombinationView(name: "Three of a Kind", combination: threeOfAKind)

                        CombinationView(name: "Two Pair", combination: twoPair)

                        CombinationView(name: "One Pair", combination: onePair)

                        CombinationView(name: "High Card", combination: highCard)
                    }
                    .overlay {
                        VStack {
                            HStack {
                                Spacer()
                                
                                Button {
                                    isInfoShown.toggle()
                                } label: {
                                    Image(systemName: "questionmark.bubble")
                                        .foregroundColor(.white)
                                }
                                .padding(.top, 10)
                                .padding(.trailing)
                            }
                            
                            Spacer()
                        }
                        
                    }
                }
                .padding(.top)
                .hideScrollIndicator()
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .fullScreenCover(isPresented: $isInfoShown) {
            CombinationsInfoView()
        }
    }
}

#Preview {
    AllCombinationsView(){}
}


struct CombinationView: View {
    
    var name: String
    var combination: [String]
    
    var body: some View {
        
        GlassyCard(colors: [.white,.white,.white])
            .frame(width: screenSize().width - 30, height: 130)
            .overlay {
                VStack {
                    HStack {
                        Text(name)
                            .foregroundColor(.white)
                            .frame(width: screenSize().width - 110, alignment: .leading)
                    }
                    
                    HStack {
                        ForEach(combination, id: \.self) { card in
                            CardSuitView(card: card, weight: 50, height: 70)
                        }
                    }
                }
            }
    }
}
