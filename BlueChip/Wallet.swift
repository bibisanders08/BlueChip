//
//  Wallet.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import Foundation
import RealmSwift


class Wallet:  Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var walletName: String = ""
    @Persisted var transactions = RealmSwift.List<WalletTransaction>()
}

class WalletTransaction: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId

    @Persisted var value: Double = 0
    @Persisted var type: String = ""
    @Persisted var note: String = ""
    @Persisted var imageData: Data?
    @Persisted var date: String = ""

}


extension Wallet {
    static var example: Wallet {
        let list = Wallet()
        list.walletName = "New wallet"
        
        let transaction = WalletTransaction()
        transaction.value = 1
        transaction.type = "+"
        
        for _ in 1..<15 {
            list.transactions.append(transaction)
        }
        
        return list
        
    }
}

extension WalletTransaction {
    static var example: WalletTransaction {
            let tr = WalletTransaction()
        tr.value = 12.12345
        tr.type = "+"
        tr.date = "01.01.2022"
        tr.note = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
            return tr
        }
}
