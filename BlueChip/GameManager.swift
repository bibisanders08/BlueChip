//
//  GameManager.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import Foundation


class GameManager {
    static let shared = GameManager()
    
    private init(){}
    
    let game: [Game] = [
        Game(stol: ["7D", "QH", "KD", "TC"], hand: ["AS", "JC"], otherHand: ["9H", "AC"], question: "What's your combination?", answer: "Straight"),
        Game(stol: ["KH", "5H", "JH", "6D", "3H"], hand: ["3C", "3S"], otherHand: ["QS", "5C"], question: "What's your combination?", answer: "3 of a Kind"),
        Game(stol: ["5H", "3C", "JD", "9H"], hand: ["2D", "TS"], otherHand: ["3H", "5S"], question: "What's your combination?", answer: "High card"),
        Game(stol: ["2H", "AD", "KH", "3S", "3D"], hand: ["5D", "6S"], otherHand: ["4S", "KD"], question: "What hand does your opponent have?", answer: "One Pair"),
        Game(stol: ["3D", "KC", "AH", "2D"], hand: ["2C", "2H"], otherHand: ["5C", "4H"], question: "What hand does your opponent have?", answer: "Straight"),
        Game(stol: ["9S", "5S", "QH", "3H"], hand: ["3C", "3D"], otherHand: ["QD", "KC"], question: "What hand does your opponent have?", answer: "Two Pair"),
        Game(stol: ["9D", "KH", "AH", "5D", "JH"], hand: ["QD", "TC"], otherHand: ["QC", "QH"], question: "Which combination wins?", answer: "Straight"),
        Game(stol: ["TD", "7S", "QH", "AD", "7D"], hand: ["KS", "AS"], otherHand: ["JS", "KD"], question: "Which combination wins?", answer: "Two Pair"),
        Game(stol: ["4C", "8C", "6D", "JC", "2S"], hand: ["2C", "TC"], otherHand: ["3H", "5C"], question: "Which combination wins?", answer: "Flush"),
        Game(stol: ["5H", "6C", "KS", "4D", "3S"], hand: ["3D", "AD"], otherHand: ["2D", "7D"], question: "Which combination wins?", answer: "Straight")
    ]
    
    
}
