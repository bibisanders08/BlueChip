import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.darkBlue, .darkBlue, .darkBlue],
                startPoint: .top,
                endPoint: .bottom)
            .ignoresSafeArea()
            
            GeometryReader { proxy in
                
                let size = proxy.size
                
                Color.black
                    .opacity(0.7)
                    .blur(radius: 200)
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color.lightPink)
                    .padding(50)
                    .blur(radius: 120)
                    .offset(x: -size.width / 1.8, y: -size.height / 5)
                
                Circle()
                    .fill(Color.lightBlue)
                    .padding(50)
                    .blur(radius: 150)
                    .offset(x: size.width / 1.8, y: -size.height / 2)
                
                
                Circle()
                    .fill(Color.lightPink)
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: size.width / 1.8, y: size.height / 3)
                
                Circle()
                    .fill(Color.lightBlue)
                    .padding(50)
                    .blur(radius: 150)
                    .offset(x: -size.width / 1.4, y: size.height / 1.2)
                
            }
        }
    }
}

#Preview {
    BackgroundView()
}
