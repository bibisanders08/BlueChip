//
//  StorageManager.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import SwiftUI
import RealmSwift


class StorageManager {
    
    @ObservedResults(Wallet.self) var wallets
    
    static let shared = StorageManager()
    
    private init() {}
    
    let realm = try! Realm()
    
    func deleteAllDate() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError {
            print("Ошибка при удалении данных из Realm: \(error.localizedDescription)")
        }
    }
    
    func createNewWalet(name: String) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let newWallet = Wallet()
        newWallet.walletName = name
        $wallets.append(newWallet)
    }
    
    func addTransaction(wallet: Wallet, value: Double, note: String, type: String, image: UIImage?, date: Date ) {
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        let newTransaction = WalletTransaction()
        newTransaction.value = (value * 100).rounded() / 100
        newTransaction.note = note
        newTransaction.type = type
        newTransaction.date = dateFormatter.string(from: date)
        
        if let guardImage = image {
            guard let imageData = guardImage.jpegData(compressionQuality: 1.0) else { return }
            newTransaction.imageData = imageData
        } else {
            newTransaction.imageData = nil
        }
        
        
        do {
            let selectedWalletRef = ThreadSafeReference(to: wallet)
            
            try realm.write {
                guard let selectedWallet = realm.resolve(selectedWalletRef) else { return }
                selectedWallet.transactions.append(newTransaction)
            }
        } catch {
            print("Error adding word: \(error.localizedDescription)")
        }
        
    }
    
    func getWallets() -> [Wallet] {
        var wallets: [Wallet] = []
        for wallet in StorageManager.shared.wallets {
            wallets.append(wallet)
        }
        return wallets
    }
}
