//
//  CardSuitView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

var cards = ["AS", "AD", "AC", "AH",
             "2S", "2D", "2C", "2H",
             "3S", "3D", "3C", "3H",
             "4S", "4D", "4C", "4H",
             "5S", "5D", "5C", "5H",
             "6S", "6D", "6C", "6H",
             "7S", "7D", "7C", "7H",
             "8S", "8D", "8C", "8H",
             "9S", "9D", "9C", "9H",
             "TS", "TD", "TC", "TH",
             "JS", "JD", "JC", "JH",
             "QS", "QD", "QC", "QH",
             "KS", "KD", "KC", "KH"]


struct CardSuitView: View {
    
    var card: String
    var weight: CGFloat
    var height: CGFloat
    @State var cardName = "?"
    @State var carSuit: Image?
    @State var color: Color?
    
    var body: some View {
        ZStack {
            Rectangle()
                .cornerRadius(12)
                .frame(width: weight, height: height)
                .foregroundColor(.white)
                .shadow(radius: 10)
                .overlay {
                    ZStack {
                        VStack {
                            HStack {
                                Text(cardName)
                                Spacer()
                            }
                            
                            Spacer()
                            
                            HStack {
                                Spacer()
                                Text(cardName)
                            }
                        }
                        .font(.system(size: weight > 50 ? 22 : 10, weight: .bold))
                        .padding()
                        .overlay {
                            if let image = carSuit {
                                image
                            }
                        }
                    }
                    .foregroundColor(color)
                }
            
        }
        .onAppear {
            cardName = getFirstCharacterAsString(input: card) ?? "A"
            carSuit = getSecondCharacter(input: card)
        }
    }
    
    func getSecondCharacter(input: String) -> Image? {
        guard input.count >= 2 else {
            return nil
        }
        let index = input.index(input.startIndex, offsetBy: 1)
        let suit = input[index]
        
        switch suit {
        case "S": color = .black
        case "D":  color = .red
        case "C":  color = .black
        case "H":  color = .red
        default: return nil
        }
        
        switch suit {
        case "S": return Image(systemName: "suit.spade.fill")
        case "D": return Image(systemName: "suit.diamond.fill")
        case "C": return Image(systemName: "suit.club.fill")
        case "H": return Image(systemName: "suit.heart.fill")
        default: return nil
        }
    }
    
    func getFirstCharacterAsString(input: String) -> String? {
        guard !input.isEmpty else {
            return nil
        }
        return String(input.prefix(1))
    }
    
}

#Preview {
    CardSuitView(card: "?", weight: 200, height: 300)
}



