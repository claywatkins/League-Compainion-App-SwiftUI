//
//  FetchService.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import Foundation

class FetchService {
    let apiInteraction = APIInteraction.shared
    var normalMMR: Normal?
    var rankedMMR: Ranked?
    
    func getMMR(for summoner: String, then: @escaping () -> Void) {
        apiInteraction.getMMR(for: summoner) { result in
            guard let mmr = try? result.get() else { return }
            self.normalMMR = mmr.normal
            self.rankedMMR = mmr.ranked
            then()
        }
    }
    
}
