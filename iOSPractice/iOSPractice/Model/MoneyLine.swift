//
//  MoneyLine.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/15/20.
//

import Foundation
struct MoneyLine: Codable {
    let data: [Data]
}

struct Data: Codable {
    let sites: [Site]
    let teams: [String]
}

struct Site: Codable {
    //H2H: [-100, 115]
    let odds: [String: [Int]]
}
