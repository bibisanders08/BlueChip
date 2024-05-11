//
//  NetworkManager.swift
//  BlueChip
//
//  Created by admin on 5/11/24.
//



import Foundation

enum CustomError: Error {
    case invalidUrl
}

class NetworkManager {
    
    var keys = [
        "a5f7043fcfmsh3f30e4ac2f79e5bp15b354jsn5545e9f1bc84"
    ]
    
    static let shared = NetworkManager()
    
    private init(){}
    
    
    func getPersent(
        firstHand: String,
        secondHand: String,
        firstBoard: String,
        secondBoard: String,
        thirdBoard: String,
        fourthBoard: String,
        fifthBoard: String,
        currentIndex: Int = 0,
        completion: @escaping (Percentage?, Error?) -> Void) {

        guard currentIndex < keys.count else {
            completion(nil, NSError(domain: "AllKeysFailed", code: -1, userInfo: nil))
            return
        }
        
        let apiKey = keys[currentIndex]
        print(apiKey)
        
        let headers = [
            "X-RapidAPI-Key": apiKey,
            "X-RapidAPI-Host": "poker-hand-ranking.p.rapidapi.com"
        ]
        
        var url = "https://poker-hand-ranking.p.rapidapi.com/rapidapi/poker-hands/?type=hand-chances&other_players_in_hand=1&my_card_1=\(firstHand)&my_card_2=\(secondHand)"
            
            if !firstBoard.isEmpty {
                url += "&community_card_1=\(firstBoard)"
            }
            if !secondBoard.isEmpty {
                url += "&community_card_2=\(secondBoard)"
            }
            if !thirdBoard.isEmpty {
                url += "&community_card_3=\(thirdBoard)"
            }
            if !fourthBoard.isEmpty {
                url += "&community_card_4=\(fourthBoard)"
            }
            if !fifthBoard.isEmpty {
                url += "&community_card_5=\(fifthBoard)"
            }
            
            let request = NSMutableURLRequest(url: NSURL(string: url)! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, NSError(domain: "HTTPError", code: -1, userInfo: nil))
                print("Response error")
                return
            }
            
            switch httpResponse.statusCode {
            case 200:
                guard let data = data else {
                    completion(nil, NSError(domain: "NoData", code: -1, userInfo: nil))
                    print("Data error")
                    return
                }
                
                do {
                    let news = try JSONDecoder().decode(Percentage.self, from: data)
                    completion(news, nil)
                } catch {
                    print("Decoder error: \(error.localizedDescription)")
                    completion(nil, error)
                }
          //  case 429:
            //    print("KEY IS EMPTY: \(apiKey)")
               // self.getDailyNews(currentIndex: currentIndex + 1, completion: completion)
            default:
                completion(nil, NSError(domain: "HTTPError", code: httpResponse.statusCode, userInfo: nil))
                print("Response error with status code: \(httpResponse.statusCode)")
            }
        }
        
        dataTask.resume()
    }
}
