//
//  Odds.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/15/20.
//

import Foundation

//per one matchup
class MatchupOdds: Hashable {
    
    var matchupOdds: [String: Double]
    
    init(matchupOdds: [String: Double]) {
        self.matchupOdds = matchupOdds
    }
    
    static func == (lhs: MatchupOdds, rhs: MatchupOdds) -> Bool {
        return lhs.matchupOdds == rhs.matchupOdds
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(matchupOdds)
    }
}
