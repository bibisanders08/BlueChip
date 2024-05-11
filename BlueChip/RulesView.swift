//
//  RulesView.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct RulesView: View {
    
    var completion: () -> ()
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                    .onAppear {
                        completion()
                    }
                
                ScrollView {
                    VStack {
                        
                        Text("Texas Hold'em Rules")
                            .font(.system(size: 28, weight: .black))
                            .foregroundColor(Color.white)
                        
                        RulesDetailView(header: InfoManager.shared.r1, text: InfoManager.shared.r1Info)
                        RulesDetailView(header: InfoManager.shared.r2, text: InfoManager.shared.r2Info)
                        RulesDetailView(header: InfoManager.shared.r3, text: InfoManager.shared.r3Info)
                        RulesDetailView(header: InfoManager.shared.r4, text: InfoManager.shared.r4Info)
                        RulesDetailView(header: InfoManager.shared.r5, text: InfoManager.shared.r5Info)
                        RulesDetailView(header: InfoManager.shared.r6, text: InfoManager.shared.r6Info)
                        RulesDetailView(header: InfoManager.shared.r7, text: InfoManager.shared.r7Info)
                        RulesDetailView(header: InfoManager.shared.r8, text: InfoManager.shared.r8Info)
                        RulesDetailView(header: InfoManager.shared.r9, text: InfoManager.shared.r9Info)
                        RulesDetailView(header: InfoManager.shared.r10, text: InfoManager.shared.r10Info)
                        RulesDetailView(header: InfoManager.shared.r11, text: InfoManager.shared.r11Info)
                    }
                }
                .padding(.top)
                .hideScrollIndicator()
            }
            //MARK: - NavBar
            .modifier(NavBarBackground())
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RulesView(){}
}


struct RulesDetailView: View {
    
    var header: String
    var text: String
    
    @Namespace private var namespace
    @State var isShown = false
    
    var body: some View {
        VStack {
            
            if isShown {
                Text(text)
                    .foregroundColor(.white)
                    .frame(width: screenSize().width - 50, alignment: .leading)
                    .padding()
                    .background(
                        GeometryReader { geometry in
                            GlassyCard(colors: [.white,.white,.white])
                                .frame(height: geometry.size.height)
                        }
                    )
                    .onTapGesture {
                        withAnimation(.linear) {
                            isShown.toggle()
                        }
                    }
                    .matchedGeometryEffect(id: "shape", in: namespace)
                    
            } else {
                Text(header)
                    .foregroundColor(.white)
                    .frame(width: screenSize().width - 50, alignment: .leading)
                    .padding()
                    .background(
                        GeometryReader { geometry in
                            GlassyCard(colors: [.white,.white,.white])
                                .frame(height: geometry.size.height)
                        }
                    )
                    .overlay {
                        HStack {
                            Spacer()
                            
                            Image(systemName: "arrow.forward")
                                .padding(.trailing)
                                .foregroundColor(.white)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.linear) {
                            isShown.toggle()
                        }
                    }
                    .matchedGeometryEffect(id: "shape", in: namespace)
            }
            
            
        }
    }
}
