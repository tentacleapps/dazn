//
//  MN4DaznTests.swift
//  MN4DaznTests
//
//  Created by Marcin Nowak on 17/01/2019.
//  Copyright © 2019 Marcin Nowak. All rights reserved.
//

import Quick
import Nimble

@testable import MN4Dazn


class NewsTests: QuickSpec {
    override func spec() {
        
        describe("The News") {
            
            context("Can be created with valid XML") {
                let sut = NewsProviderMock()
                let data = sut.getNews()
                
                it("shoud have 10 news") {
                    expect(data?.channel.items?.count).to(equal(10))
                }
                
                it("can parse item") {
                    guard let items = data?.channel.items else {
                        fail("empty")
                        return
                    }
                    expect(items[0].title).to(equal("Lead story headline goes here"))
                    expect(items[0].imageUrl).to(equal("http://www.mobilefeeds.performgroup.com/javaImages/4b/ce/0,,14012~11849291,00.jpg"))
                }
            }
        }
    }
}
