//
//  ExercisesView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct ExercisesView: View {
    
    var completion: () -> ()
    let exercises = ["Combinations", "Hand comparison", "Outs", "Chances of improvement", "Bank odds"]
    let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    @State var isAnimationShown = false
    @State var isGameShown = false

    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onAppear {
                        completion()
                    }
                
                VStack {
                    Text("Exercises")
                        .font(.system(size: 28, weight: .black))
                        .foregroundColor(Color.white)
                    
                    LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                        ForEach(0..<exercises.count, id: \.self) { index in
                            Button {
                                if exercises[index] != "Combinations" {
                                    withAnimation {
                                        isAnimationShown.toggle()

                                    }
                                } else {
                                    isGameShown.toggle()
                                }
                            } label: {
                                Rectangle()
                                    .frame(height: 120)
                                    .cornerRadius(12)
                                    .foregroundColor(.darkBlue)
                                    .shadow(radius: 10)
                                    .overlay {
                                        VStack {
                                            Text(exercises[index])
                                                .font(.system(size: 20, weight: .semibold))
                                                .foregroundColor(.white)
                                            
                                            if exercises[index] != "Combinations" {
                                                Image(systemName: "lock.circle")
                                                    .font(.system(size: 30))
                                                    .foregroundColor(.yellow)
                                            }
                                        }
                                    }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
        }
        .fullScreenCover(isPresented: $isGameShown) {
            GameView()
        }
        .overlay {
            if isAnimationShown {
                ZStack {
                    GlassyCard(colors: [.clear, .clear, .clear])
                        .opacity(isAnimationShown ? 1 : 0)
                        .ignoresSafeArea()
                    
                    Rectangle()
                        .foregroundColor(.darkBlue)
                        .frame(width: screenSize().width - 40, height: 200)
                        .scaleEffect(isAnimationShown ? 1 : 0)
                        .cornerRadius(12)
                        .shadow(radius: 10)
                        .overlay {
                            VStack {
                                Text("Please complete the previous training sessions to unlock this theme.")
                                    .foregroundColor(.white)
                                
                                Button {
                                    withAnimation {
                                        isAnimationShown.toggle()
                                    }
                                } label: {
                                    Text("Close")
                                        .foregroundColor(.red)
                                }
                                .padding()
                                
                            }
                        }
                }
            }
           
            
        }
    }
}

#Preview {
    ExercisesView(){}
}
