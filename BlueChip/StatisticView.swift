//
//  StatisticView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI
import SwiftUICharts

struct StatisticView: View {
    
    @State var isTransactionShown = false
    @StateObject var vm = StatisticViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 20) {
                    VStack {
                        GlassyCard(colors: [.darkBlue,.darkBlue,.darkBlue])
                            .frame(width: screenSize().width - 20, height: 300)
                            .overlay {
                                VStack {
                                    LineView(
                                        data: vm.statistic,
                                        style: ChartStyle(backgroundColor: .clear, accentColor: .white, gradientColor: GradientColor(start: .lightBlue, end: .lightPink),
                                                          textColor: .white,
                                                          legendTextColor: .white,
                                                          dropShadowColor: .white))
                                    .padding(.horizontal)
                                }
                            }
                    }
                    
                    HStack {
                        Text("Revenues and expenses")
                            .font(.system(size: 24, weight: .semibold))
                        
                        Spacer()
                        
                        Button {
                            isTransactionShown.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    StatListView(transactions: vm.transactions)
                }
            }
            .fullScreenCover(isPresented: $isTransactionShown) {
                AddTransactionView() {
                    vm.prepare()
                    vm.getStat()
                }
            }
            .onAppear {
                vm.prepare()
                vm.getStat()
            }
            //MARK: - NavBar
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        VStack {
                            HStack(spacing: 3) {
                                Text("Statistic")
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
        .tint(.white)
    }
}

#Preview {
    StatisticView()
}
