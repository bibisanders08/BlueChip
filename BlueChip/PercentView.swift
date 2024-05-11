//
//  PercentView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct PercentView: View {
    
    
    @State var hand: [String] = ["?", "?"]
    @State var board: [String] = ["?", "?", "?", "?","?"]
    @State var knownCards: [String] = []
    
    @State var firstHandCard = ""
    @State var secondHandCard = ""
    
    @State var firstBoardCard = ""
    @State var secondBoardCard = ""
    @State var thirdBoardCard = ""
    @State var fourthBoardCard = ""
    @State var fifthBoardCard = ""
    
    @State var percentage = "0"
    
    @State var isSuitsShown = true
    @State var isDataLoaded = false
    @State var isAlertShown = false
    
    private let adaptiveColumn = [
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1),
        GridItem(.fixed(30), spacing: 1)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView {
                    VStack {
                        ZStack {
                            GlassyCard(colors: [.darkBlue, .darkBlue, .darkBlue])
                                .frame(width: screenSize().width - 20, height: 300)
                            HStack {
                                VStack {
                                    Text("Hand")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 40)
                                        .padding(.top)
                                    
                                    HStack {
                                        ForEach(hand, id: \.self) { card in
                                            CardSuitView(card: card, weight: 50, height: 70)
                                        }
                                    }
                                    
                                    
                                    
                                    Text("Bord")
                                        .font(.system(size: 22, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 40)
                                        .padding(.top)
                                    
                                    HStack {
                                        ForEach(board, id: \.self) { card in
                                            CardSuitView(card: card, weight: 50, height: 70)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                        }
                        .overlay {
                            VStack {
                                HStack {
                                    Spacer()
                                    
                                    Button {
                                        clear()
                                    } label: {
                                        Image(systemName: "xmark")
                                    }
                                    .foregroundColor(.white)
                                }
                                Spacer()
                            }
                            .padding()
                            
                            
                        }
                        
                        
                        Button {
                            withAnimation {
                                isAlertShown.toggle()
                            }
                            NetworkManager.shared.getPersent(
                                firstHand: firstHandCard,
                                secondHand: secondHandCard,
                                firstBoard: firstBoardCard,
                                secondBoard: secondBoardCard,
                                thirdBoard: thirdBoardCard,
                                fourthBoard: fourthBoardCard,
                                fifthBoard: fifthBoardCard) { percentage, error in
                                    if let error = error {
                                        print("Error: \(error)")
                                    } else if let percentage = percentage {
                                        print("DATA: \(percentage)")
                                        self.percentage = String(percentage.data.percentage)
                                        isDataLoaded.toggle()
                                    }
                                }
                        } label: {
                            ZStack {
                                 Rectangle()
                                     .frame(width: screenSize().width - 40, height: 70)
                                     .cornerRadius(12)
                                     .foregroundColor(.lightPink)
                                 
                                 Text("Find out Percent")
                                     .foregroundColor(.white)
                                     .font(.system(size: 22))
                             }
                             
                         }
                         .padding(.top)
                         
                         
                         HStack {
                             Spacer()
                             
                             Button {
                                 withAnimation {
                                     isSuitsShown.toggle()
                                 }
                             } label: {
                                 Image(systemName: isSuitsShown ? "circle.grid.3x3" : "suit.spade.fill")
                             }
                             .foregroundColor(.white)
                         }
                         .padding()
                         
                         if isSuitsShown {
                             ScrollView(.horizontal) {
                                 HStack {
                                     ForEach(cards, id: \.self) { card in
                                         Button {
                                             appendCard(card: card)
                                         } label: {
                                             CardSuitView(card: card, weight: 150, height: 200)
                                                 .padding(.horizontal, 10)
                                         }
                                     }
                                 }
                             }
                             .hideScrollIndicator()
                         } else {
                             ScrollView {
                                 LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                                     ForEach(0..<cards.count, id: \.self) { index in
                                         Button {
                                             appendCard(card: cards[index])
                                         } label: {
                                             Text(cards[index])
                                                 .foregroundColor(.white)
                                         }
                                     }
                                 }
                             }
                         }
                         
                         
                         Spacer()
                         
 //                        VStack {
 //
 //                        }
 //                        .frame(height: 100)
                     }
                 }
                 .padding(.bottom, 20)
                 .hideScrollIndicator()
             }
             
             //MARK: - NavBar
             .modifier(NavBarBackground())
             .navigationBarTitleDisplayMode(.inline)
             .toolbar {
                 ToolbarItem(placement: .principal) {
                     HStack {
                         VStack {
                             HStack(spacing: 3) {
                                 Text("Percentage")
                                     .font(.system(size: 28, weight: .black, design: .rounded))
                                     .foregroundColor(Color.white)
                                 
                                 Spacer()
                             }
                             
                         }
                         Spacer()
                     }
                     
                 }
             }
         }
         .ignoresSafeArea()
         .modifier(HideTabBar())
         .overlay {
             if isAlertShown {
                 ZStack {
                     Rectangle()
                         .opacity(0.5)
                         .ignoresSafeArea()
                     
                     Rectangle()
                         .frame(width: screenSize().width - 40, height: 300)
                         .foregroundColor(.lightPink)
                         .cornerRadius(12)
                         .overlay {
                             VStack {
                                 if isDataLoaded {
                                     Text("Your Percentage")
                                         .foregroundColor(.white)
                                         .font(.system(size: 22, weight: .bold))
                                     
                                     Text(percentage + "%")
                                         .foregroundColor(.white)
                                         .font(.system(size: 72, weight: .bold))
                                         .padding(.vertical)
                                     
                                     Button {
                                         withAnimation {
                                             isAlertShown.toggle()
                                         }
                                         percentage = "0"
                                         isDataLoaded.toggle()
                                         clear()
                                     } label: {
                                         Text("Close")
                                             .foregroundColor(.white)
                                     }
                                 } else {
                                     ProgressView()
                                         .controlSize(.large)
                                 }
                             }
                         }
                 }
             }
             
         }
     }
     
     func clear() {
         hand = ["?","?"]
         board = ["?", "?", "?", "?","?"]
         knownCards = []
         
         firstHandCard = ""
         secondHandCard = ""
         
         firstBoardCard = ""
         secondBoardCard = ""
         thirdBoardCard = ""
         fourthBoardCard = ""
         fifthBoardCard = ""
     }
     
     func appendCard(card: String) {
         
         if !knownCards.contains(card) {
             if firstHandCard.isEmpty {
                 hand.remove(at: 0)
                 hand.insert(card, at: 0)
                 firstHandCard = card
                 knownCards.append(card)
                 return
             }
             
             if secondHandCard.isEmpty {
                 hand.remove(at: 1)
                 hand.insert(card, at: 1)
                 secondHandCard = card
                 knownCards.append(card)
                 
                 return
             }
             
             if firstBoardCard.isEmpty {
                 board.remove(at: 0)
                 board.insert(card, at: 0)
                 firstBoardCard = card
                 knownCards.append(card)
                 
                 return
             }
             
             if secondBoardCard.isEmpty {
                 board.remove(at: 1)
                 board.insert(card, at: 1)
                 secondBoardCard = card
                 knownCards.append(card)
                 
                 return
             }
             
             if thirdBoardCard.isEmpty {
                 board.remove(at: 2)
                 board.insert(card, at: 2)
                 thirdBoardCard = card
                 knownCards.append(card)
                 
                 return
             }
             
             if fourthBoardCard.isEmpty {
                 board.remove(at: 3)
                 board.insert(card, at: 3)
                 fourthBoardCard = card
                 knownCards.append(card)
                 
                 return
             }
             
             if fifthBoardCard.isEmpty {
                 board.remove(at: 4)
                 board.insert(card, at: 4)
                 fifthBoardCard = card
                 knownCards.append(card)
                 
                 return
             }
             
             
         }
     }
 }

 #Preview {
     PercentView()
 }

