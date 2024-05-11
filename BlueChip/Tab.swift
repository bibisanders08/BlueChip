//
//  Tab.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI

enum Tab: Int, Identifiable, CaseIterable, Comparable {
    static func < (lhs: Tab, rhs: Tab) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
    
    case home, stat, percent, settings
    
    internal var id: Int { rawValue }
    
    var icon: String {
        switch self {
        case .home:
            return "house.fill"
        case .stat:
            return "chart.bar.fill"
        case .percent:
            return "suit.spade.fill"
        case .settings:
            return "gearshape.fill"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .stat:
            return "Statistic"
        case .percent:
            return "Percent"
        case .settings:
            return "Movies"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .indigo
        case .stat:
            return .pink
        case .percent:
            return .orange
        case .settings:
            return .teal
        }
    }
}
