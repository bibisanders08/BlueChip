//
//  PokerChanse.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import Foundation


// MARK: - Percent
struct Percentage: Codable {
    let data: DataClass
    let request: Request
}

// MARK: - DataClass
struct DataClass: Codable {
    let percentage, ratio: Double
    let validInputs: [String]

    enum CodingKeys: String, CodingKey {
        case percentage, ratio
        case validInputs = "valid_inputs"
    }
}

// MARK: - Request
struct Request: Codable {
    let status: Int
    let endpoint: String
    let time: Int
    let processSpeed: Double
    let note: [String]
}
