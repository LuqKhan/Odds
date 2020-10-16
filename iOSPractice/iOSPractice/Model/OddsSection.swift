//
//  OddsSection.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/15/20.
//

import Foundation

//section has an array of matchup odds
class MatchupOddsSection: Hashable {
    
    var allOdds = [MatchupOdds]()
    var allSections = [MatchupOddsSection]()

    
    static func == (lhs: MatchupOddsSection, rhs: MatchupOddsSection) -> Bool {
       return lhs.allOdds == rhs.allOdds
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(allOdds)
    }

}
