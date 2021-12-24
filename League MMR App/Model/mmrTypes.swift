//
//  mmrTypes.swift
//  League MMR App
//
//  Created by Clayton Watkins on 12/23/21.
//

import Foundation
struct MMR: Codable {
    var ranked: Ranked
    var normal: Normal
}

struct Ranked: Codable {
    var avg: Int?
    var timestamp: Double?
    var historical: [Historical]?
}
 
struct Normal: Codable {
    var avg: Int?
    var timestamp: Double?
    var historical: [Historical]?
}

struct Historical: Codable {
    var avg: Int?
    var timestamp: Double?
}

struct HistoricalDate {
    var avg: Int
    var date: Double
    
    init(avg: Int, date: Double) {
        self.avg = avg
        self.date = date
    }
}
