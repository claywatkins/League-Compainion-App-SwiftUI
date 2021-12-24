//
//  SummonerMMRViewModel.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import Foundation

class SummonerMMRViewModel: ObservableObject {
    let fetchService: FetchService
    
    @Published var summonerName: String = ""
    @Published var normalMMR: Int = 0
    @Published var rankedMMR: Int = 0
    
    init(fetchService: FetchService) {
        self.fetchService = fetchService
    }
    
    func getMMR() {
        fetchService.getMMR(for: summonerName) {
            DispatchQueue.main.async {
                if let normalMMR = self.fetchService.normalMMR?.avg {
                    self.normalMMR = normalMMR
                    print("Done with normal!")
                }
                if let rankedMMR = self.fetchService.rankedMMR?.avg {
                    self.rankedMMR = rankedMMR
                    print("Done with ranked!")
                }
            }
        }
    }
}
