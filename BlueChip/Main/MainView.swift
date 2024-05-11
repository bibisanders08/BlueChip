

import SwiftUI

struct MainView: View {
    
    var completion: () -> ()
    
    
    var activities = ["Exercises", "Rules", "Combinations", "Tips"]
    let adaptiveColumn = [
        GridItem(.adaptive(minimum: 150, maximum: 250))
    ]
    
    @State var isTabHidden = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onAppear {
                        if isTabHidden {
                            completion()
                            isTabHidden.toggle()
                        }
                        
                    }
                
                ScrollView {
                    VStack {
                        VStack(spacing: 40) {
                            Text("Your personal Trainer")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.top, 20)
                            
                            Image("logo")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                            Spacer()
                        }
                        .frame(width: screenSize().width - 20, height: 250)
                        
                        
                        Text("Activities")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: screenSize().width - 40, alignment: .leading)
                        
                        
                        LazyVGrid(columns: adaptiveColumn, spacing: 20) {
                            ForEach(0..<activities.count, id: \.self) { index in
                                NavigationLink {
                                    switch activities[index] {
                                    case "Exercises":
                                        ExercisesView {
                                            completion()
                                            isTabHidden.toggle()
                                        }
                                    case "Rules":
                                        RulesView {
                                            completion()
                                            isTabHidden.toggle()
                                        }
                                    case "Tips":
                                        TipsView {
                                            completion()
                                            isTabHidden.toggle()
                                        }
                                    case "Combinations":
                                        AllCombinationsView() {
                                            completion()
                                            isTabHidden.toggle()
                                        }
                                        
                                        
                                    default:
                                        RulesView {
                                        completion()
                                        isTabHidden.toggle()
                                    }
                                    }
                                } label: {
                                    GlassyCard(colors: [.white.opacity(0.1), .white.opacity(0.1), .black.opacity(0.1)])
                                        .frame(width: screenSize().width / 2 - 20, height: 150)
                                        .overlay {
                                            VStack {
                                                Image(activities[index])
                                                    .resizable()
                                                    .frame(width: 50, height: 50)
                                                Text(activities[index])
                                                    .font(.system(size: 18, weight: .bold, design: .rounded))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                            }
                        }
                        Spacer()
                        
                        VStack {
                            
                        }
                        .frame(height: 100)
                    }
                    
                }
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
                                  Text("BlueChip")
                                      .font(.system(size: 28, weight: .black, design: .rounded))
                                      .foregroundColor(Color.white)
                                  
                                  Spacer()
                              }
                              
                          }
                          Spacer()
                      }
                      .ignoresSafeArea()
                  }
              }
          }
          .ignoresSafeArea()
          .tint(.white)
          .preferredColorScheme(.dark)
          
      }
  }

  #Preview {
      MainView(){}
          .preferredColorScheme(.light)
  }


  struct NavBarBackground: ViewModifier {
      
      @ViewBuilder
      func body(content: Content) -> some View {
          if #available(iOS 16.0, *) {
              content
                  .toolbarBackground(.hidden, for: .navigationBar)
          } else {
              content
          }
      }
  }

