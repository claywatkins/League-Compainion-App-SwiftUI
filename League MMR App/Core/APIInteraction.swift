//
//  API.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import Foundation

enum NetworkError: Error {
    case noData
    case badDecode
    case tryAgain
}

public final class APIInteraction {
    static let shared = APIInteraction()
    
    let baseURL = URL(string: "https://na.whatismymmr.com")!

    func getMMR(for summonerName: String, completion: @escaping (Result<MMR, NetworkError>) -> Void) {
        
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)!
        urlComponents.path = "/api/v1/summoner"
        urlComponents.queryItems = [
            URLQueryItem(name: "name", value: summonerName)
        ]
        let requestURL = urlComponents.url?.absoluteURL
        var request = URLRequest(url: requestURL!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, error) in
            if let error = error {
                print(error)
                completion(.failure(.tryAgain))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let returnedMMRdata = try JSONDecoder().decode(MMR.self, from: data)
                completion(.success(returnedMMRdata))
            } catch {
                print("Error decoding MMR data: \(error)")
            }
        }
        task.resume()
    }
    
}
