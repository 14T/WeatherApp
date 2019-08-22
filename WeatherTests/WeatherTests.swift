//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    private static let defaultWait = 20.0

    override func setUp() {
        super.setUp()
        NetworkManager.shared.isUsingMockData = true
    }

    override func tearDown() {
        super.tearDown()
        
    }

    func testSearchCities() {
      
        let expectation = self.expectation(description:"\(#function)\(#line)")

        let service = SearchCityService()
        service.searchCity(query: "mock") { (cities, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(cities)
            XCTAssertEqual(cities?.count, 5)
            
            expectation.fulfill()
        }
        waitForExpectations(timeout: WeatherTests.defaultWait, handler: nil)
    }


    func testCityDetail() {
        
        let expectation = self.expectation(description:"\(#function)\(#line)")

        let service = CityDetailService()
        
        service.getCityDetail(query: "mock") { (cityDetail, error) in
            XCTAssertNil(error)
            XCTAssertNotNil(cityDetail)
            XCTAssertEqual(cityDetail?.data?.current_condition?.first?.temp_C, "10")
            
            expectation.fulfill()
        }
        waitForExpectations(timeout: WeatherTests.defaultWait, handler: nil)
    }
    
}
