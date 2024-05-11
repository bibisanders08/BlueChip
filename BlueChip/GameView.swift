

import SwiftUI

struct GameView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var index = 0
    @State var activeGame: Game?
    @State var selectedAnswer = ""
    @State var isRight = false
    @State var isStopped = false
    
    var combinations = ["High card", "One Pair", "Two Pair", "3 of a Kind", "Straight", "Flush", "Full House", "4 of a Kind", "Straight Flush", "Royal Flush"]
    let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                VStack {
                    ScrollView {
                        BoardView(game: activeGame)
                        
                        
                    }
                    .hideScrollIndicator()
                    
                    Rectangle()
                        .foregroundColor(.darkBlue)
                        .cornerRadius(12, corners: [.topLeft, .topRight])
                        .ignoresSafeArea()
                        .overlay {
                            if isStopped {
                                
                                VStack(spacing: 20) {
                                    
                                    if isRight {
                                        Text("Right")
                                            .foregroundColor(.green)
                                            .font(.system(size: 24, weight: .bold))
                                        
                                        Text("The correct answer is " + (activeGame?.answer ?? ""))
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .bold))
                                    } else {
                                        Text("False")
                                            .foregroundColor(.red)
                                            .font(.system(size: 24, weight: .bold))
                                        
                                        Text("The correct answer is " + (activeGame?.answer ?? ""))
                                            .foregroundColor(.white)
                                            .font(.system(size: 24, weight: .bold))
                                    }
                                    
                                    Button {
                                        nextQuestion()
                                    } label: {
                                        ZStack {
                                            Rectangle()
                                                .frame(width: screenSize().width - 70, height: 50)
                                                .foregroundColor(.lightPink)
                                                .cornerRadius(12)
                                            
                                            Text(index == GameManager.shared.game.count - 1 ? "Done" : "Next")
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .padding(.top, 50)
                                }
                                
                            } else {
                                ScrollView {
                                    VStack {
                                        LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                                            ForEach(0..<combinations.count, id: \.self) { index in
                                                Button {
                                                    selectedAnswer = combinations[index]
                                                    withAnimation {
                                                        checkAnswer()
                                                    }
                                                } label: {
                                                    Text(combinations[index])
                                                        .foregroundColor(.white)
                                                        .padding()
                                                        .background {
                                                            GlassyCard(colors: [.clear, .clear, .clear])
                                                                .frame(width: 150, height: 60)
                                                        }
                                                }
                                            }
                                        }
                                    }
                                    .padding(.top)
                                    .padding(.horizontal)
                                }
                                .hideScrollIndicator()
                            }
                                
                            }
                        
                        
                    }
                    
                }
                //MARK: - NavBar
                .modifier(NavBarBackground())
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            VStack {
                                HStack(spacing: 10) {
                                   
                                    Text("Practice")
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
            .onAppear {
                activeGame = GameManager.shared.game.first
            }
        }
        
        func checkAnswer() {
            isStopped = true
            if selectedAnswer == activeGame?.answer {
                isRight = true
            } else {
                isRight = false
            }
        }
        
        func nextQuestion() {
            index += 1
            
            if index < GameManager.shared.game.count {
                activeGame = GameManager.shared.game[index]
            } else {
                dismiss()
            }
            
            isStopped.toggle()
        }
    }

    #Preview {
        GameView()
    }


    struct BoardView: View {
        
        var game: Game?
        
        var body: some View {
            VStack {
                Text("Board")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .bold))
                
                HStack {
                    ForEach(game?.stol ?? [], id: \.self) { card in
                        CardSuitView(card: card, weight: 50, height: 70)
                    }
                }
                
                HStack {
                    VStack {
                        Text("Your \nHand:")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        HStack {
                            ForEach(game?.hand ?? [], id: \.self) { card in
                                CardSuitView(card: card, weight: 50, height: 70)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("Opponent's \nHand:")
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .bold))
                        
                        HStack {
                            ForEach(game?.otherHand ?? [], id: \.self) { card in
                                CardSuitView(card: card, weight: 50, height: 70)
                            }
                        }
                    }
                }
                
                
                Text(game?.question ?? "")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 32, weight: .bold))
                    .padding()
            }
            .padding(.horizontal)
        }
        
    }

