//
//  MatchupOddsController.swift
//  iOSPractice
//
//  Created by Luqmaan Khan on 10/14/20.
//

import Foundation

enum OddsType: String {
    case overUnder = "totals"
    case spread = "spreads"
    case moneyLine = "h2h"
}

class MatchupOddsController {
    
    var overUnderOdds: OverUnderMatchupOdds?
    var spreadOdds: SpreadOdds?
    var moneyLineOdds: MoneyLine?
    var section: MatchupOddsSection?
    
    init() {
        fetchOdds()
    }
    
    func prepareOddsDataSource() {
        section = MatchupOddsSection()
        let matchupOdds = MatchupOdds(matchupOdds: [.firstTeam: "Washington", .secondTeam: "Baltimore"])
        section?.allSections.first?.allOdds.append(matchupOdds)
        
    }
    
    func configureOverUnderOdds() -> MatchupOdds {
        
    }
    
    func fetchOdds() {
        let overUnderRequest = URLRequest(url: .oddsURL(oddsType: .overUnder))
        let moneyLineRequest = URLRequest(url: .oddsURL(oddsType: .moneyLine))
        let spreadRequest = URLRequest(url: .oddsURL(oddsType: .spread))
        URLSession.shared.dataTask(with: overUnderRequest) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching overUnderData: \(error)")
                return
            }
            guard let data = data else {return}
            do {
                let overUnderData = try JSONDecoder().decode(OverUnderMatchupOdds.self, from: data)
                self.overUnderOdds = overUnderData
            } catch {
                NSLog("Error decoding overunder json: \(error)")
                return
            }
        }.resume()
        
        URLSession.shared.dataTask(with: spreadRequest) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching spread: \(error)")
                return
            }
            guard let data = data else {return}
            do {
                let spreadData = try JSONDecoder().decode(SpreadOdds.self, from: data)
                self.spreadOdds = spreadData
            } catch {
                NSLog("Error decoding spread json: \(error)")
                return
            }
        }.resume()
        
        URLSession.shared.dataTask(with: moneyLineRequest) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching money line: \(error)")
                return
            }
            guard let data = data else {return}
            do {
                let moneyLineData = try JSONDecoder().decode(MoneyLine.self, from: data)
                self.moneyLineOdds = moneyLineData
            } catch {
                NSLog("Error decoding moneyline json: \(error)")
                return
            }
        }.resume()
prepareOddsDataSource()

    }
    
}

extension URL {
    static func oddsURL(oddsType: OddsType) -> URL {
        URL(string: "https://api.the-odds-api.com/v3/odds/?apiKey=3c394a7daadcf970e69e29b3167fc0ad&sport=americanfootball_nfl&region=us&mkt=\(oddsType.rawValue)&oddsFormat=american")!
    }
}
