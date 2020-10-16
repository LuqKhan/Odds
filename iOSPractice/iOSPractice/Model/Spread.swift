//
//  Spread.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/15/20.
//

import Foundation
struct SpreadOdds: Codable {
    
    let data: [SpreadOddsData]
}

struct SpreadOddsData: Codable {
    let teams: [String]
    let sites: [SpreadSite]
}

struct SpreadSite: Codable {
    let odds: Odds
}

struct Odds: Codable {
    let spreads: Spreads
}

struct Spreads: Codable {
    let points: [Point]
}
