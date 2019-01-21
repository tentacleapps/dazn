//
//  StandingsTests.swift
//  MN4DaznTests
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Quick
import Nimble

@testable import MN4Dazn

class StandingsTests: QuickSpec {
    override func spec() {
        //1
        describe("The 'Standings'") {
            //2
            context("Can be created with valid XML") {
                let sut = StandingsProviderMock()
                let data = sut.getStandings()
                
                guard let items = data?.competition?.season?.round?.resultsTable?.items else {
                    fail("Cannot parse data")
                    return
                }
                
                it("shoud have 20 teams") {
                    expect(items.count).to(equal(20))
                }
                
                it("first rank") {
                    expect(items.first?.rank).to(equal(1))
                    expect(items.first?.clubName).to(equal("Manchester City"))
                    expect(items.first?.matchesTotal).to(equal(38))
                    expect(items.first?.matchesWon).to(equal(28))
                    expect(items.first?.matchesDraw).to(equal(5))
                    expect(items.first?.matchesLost).to(equal(5))
                    expect(items.first?.goalsPro).to(equal(93))
                    expect(items.first?.goalsAgainst).to(equal(29))
                    expect(items.first?.points).to(equal(89))
                }
                
                it("last rank") {
                    expect(items.last?.rank).to(equal(20))
                    expect(items.last?.clubName).to(equal("Wolverhampton Wanderers"))
                    expect(items.last?.matchesTotal).to(equal(38))
                    expect(items.last?.matchesWon).to(equal(5))
                    expect(items.last?.matchesDraw).to(equal(10))
                    expect(items.last?.matchesLost).to(equal(23))
                    expect(items.last?.goalsPro).to(equal(40))
                    expect(items.last?.goalsAgainst).to(equal(82))
                    expect(items.last?.points).to(equal(25))
                }
            }
        }
    }
}
