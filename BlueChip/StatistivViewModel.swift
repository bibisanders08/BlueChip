//
//  StatistivViewModel.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import Foundation


class StatisticViewModel: ObservableObject {
    @Published var wallets: [Wallet] = []
    @Published var transactions: [WalletTransaction] = []
    @Published var statistic: [Double] = []
    
    func prepare() {
        wallets = []
        transactions = []
        statistic = []
        
        wallets = Array(StorageManager.shared.wallets)
        if let trans = wallets.first?.transactions {
            transactions = Array(trans)
        }
    }
    
    func getStat() {
        for tr in transactions {
            switch tr.type {
            case "+": statistic.append(tr.value)
            case "-": statistic.append(-tr.value)
            default: break
            }
        }
        print("Stat: \(statistic)")
    }
}
