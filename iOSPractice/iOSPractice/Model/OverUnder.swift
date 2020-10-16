//
//  MatchupOdds.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/14/20.
//

import Foundation


struct OverUnderMatchupOdds: Codable {
    let data: [OverUnderOddsData]
}

struct OverUnderOddsData: Codable {
    let teams: [String]
    let sites: [OverUnderSite]
}

struct OverUnderSite: Codable {
    let odds: OverUnderOdds
}

struct OverUnderOdds: Codable {
    let totals: OverUnderTotals
}

struct OverUnderTotals: Codable {
    let points: [Point]
}

enum Point: Codable {
    case double(Double)
    case string(String)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x  = try? container.decode(Double.self) {
            self = .double(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Point.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Point"))

    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .double(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
    }
}
}


