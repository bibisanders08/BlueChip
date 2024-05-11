//
//  View + Ext.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

extension View {
    var safeArea: UIEdgeInsets {
        if let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.safeAreaInsets {
            return safeArea
        }
        
        return .zero
    }
    
    
}

extension View {
    func glow(_ color: Color, radius: CGFloat) -> some View {
        self
            .shadow(color: color, radius: radius / 2.5)
            .shadow(color: color, radius: radius / 2.5)
            .shadow(color: color, radius: radius / 2.5)
    }
    
    func screenSize() -> CGSize {
        guard let window = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return window.screen.bounds.size
    }
    
    func hideScrollIndicator() -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollIndicators(.hidden)
        } else {
            return self
        }
    }
    
    func scrollContentBackgroundHidden() -> some View {
        if #available(iOS 16.0, *) {
            return self.scrollContentBackground(.hidden)
        } else {
            return self
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}



//corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

//MARK: - Bottom Sheet iOS15+
extension View {
    //binding show bariable...
    func halfSheet<Content: View>(
        showSheet: Binding<Bool?>,
        @ViewBuilder content: @escaping () -> Content,
        onDismiss: @escaping () -> Void
    ) -> some View {
        return self
            .background(
                HalfSheetHelper(sheetView: content(), showSheet: showSheet, onDismiss: onDismiss)
            )
    }
}

// UIKit integration
struct HalfSheetHelper<Content: View>: UIViewControllerRepresentable {
    
    var sheetView: Content
    let controller: UIViewController = UIViewController()
    @Binding var showSheet: Bool?
    var onDismiss: () -> Void
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let showSheet: Bool = showSheet {
            if showSheet {
                let sheetController = CustomHostingController(rootView: sheetView)
                sheetController.presentationController?.delegate = context.coordinator
                uiViewController.present(sheetController, animated: true)
            } else {
//                onDismiss()
//                uiViewController.dismiss(animated: true)
            }
            
        }
    }
    
    //on dismiss...
    final class Coordinator: NSObject, UISheetPresentationControllerDelegate {
        
        var parent: HalfSheetHelper
        
        init(parent: HalfSheetHelper) {
            self.parent = parent
        }
        
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.showSheet = false
        }
    }
}

// Custom UIHostingController for halfSheet...
final class CustomHostingController<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        view.backgroundColor = .clear
        if let presentationController = presentationController as? UISheetPresentationController {
            presentationController.detents = [.large()]
            
            //MARK: - sheet grabber visbility
            presentationController.prefersGrabberVisible = false
            presentationController.prefersScrollingExpandsWhenScrolledToEdge = false
            
            //MARK: - sheet corner radius
            presentationController.preferredCornerRadius = 10
            
        }
    }
}

public struct LazyView<Content: View>: View {
    private let build: () -> Content
    public init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}

