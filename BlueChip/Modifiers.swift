//
//  Modifiers.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

struct HideTabBar: ViewModifier {
        
    @ViewBuilder
    func body(content: Content) -> some View {
        if #available(iOS 16.0, *) {
            content
                .toolbar(.hidden, for: .tabBar)
        } else {
            content
        }
    }
}
