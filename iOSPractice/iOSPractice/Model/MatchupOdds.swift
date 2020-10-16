//
//  Odds.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/15/20.
//

import Foundation

enum MatchupOddsKeys {
    case firstTeam
    case secondTeam
    case firstTeamML
    case secondTeamML
    case firstTeamSpread
    case secondTeamSpread
    case firstTeamOverUnder
    case secondTeamOverUnder
}

enum MatchupOddsValues {
    case double
    case string
}

//per one matchup
class MatchupOdds: Hashable {
    
    var matchupOdds: [MatchupOddsKeys: MatchupOddsValues]
    
    init(matchupOdds: [MatchupOddsKeys: MatchupOddsValues]) {
        self.matchupOdds = matchupOdds
    }
    
    static func == (lhs: MatchupOdds, rhs: MatchupOdds) -> Bool {
        return lhs.matchupOdds == rhs.matchupOdds
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(matchupOdds)
    }
}
