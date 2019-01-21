//
//  ScoresTests.swift
//  MN4DaznTests
//
//  Created by Marcin Nowak on 19/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//
import Foundation
import Quick
import Nimble

@testable import MN4Dazn

class ScoresTests: QuickSpec {
    override func spec() {
        //1
        describe("Scores parsing test") {
            //2
            context("Can be created with valid xml") {
                let sut = ScoresProviderMock()
                let data = sut.getScores()
                
                guard let seasonRound = data?.competition?.season?.round else {
                    fail("Cannot parse data")
                    return
                }
   
                guard let matches = seasonRound.groups?.compactMap ({
                    $0.matches
                }).flatMap({$0}) else {
                    return
                }
    
                print(matches)
                
                it("shoud have 8 matches") {
                    expect(matches.count).to(equal(8))
                }
                
                it("date shoud have 2012-09-19") {
                    guard let date = data?.method?.parameters?.first(where: {$0.name == "date"}) else {
                        fail("did not find date parameter")
                        return
                    }
                    expect(date.value).to(equal("2012-09-19"))
                }
            }
        }
    }
    
    
}
