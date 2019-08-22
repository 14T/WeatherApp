//
//  CityStore.swift
//  WeatherTests
//
//  Created by Anand, Chetan [GCB-OT NE] on 22/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import XCTest
@testable import Weather

class CityStoreCoreDataTests: XCTestCase {
  
    let cityStore = CityStore()
    var cities = [CityViewModel]()
    override func setUp() {
        super.setUp()
        
        let expectation = self.expectation(description:"\(#function)\(#line)")

        NetworkManager.shared.isUsingMockData = true
        
        let service = SearchCityService()
        service.searchCity(query: "mock") { (cities, error) in
            self.cities = cities?.compactMap({ CityViewModel(value: $0) }) ?? [CityViewModel]()
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 40, handler: nil)
        cityStore.deleteAll()
    }
    
    override func tearDown() {
        super.tearDown()
        cityStore.deleteAll()
    }
    
    
    func testSaveToCoreData(){
        let cityViewModel = cities.first
        XCTAssertNotNil(cityViewModel)
        cityStore.update(cityViewModel: cityViewModel)
    }
    
    
    func testSavedCitiesFromCoreData(){
        
        let cityViewModel = cities.first
        XCTAssertNotNil(cityViewModel)
        cityStore.update(cityViewModel: cityViewModel)
        
        
        XCTAssertNotNil(cityStore.lastTenCity)
    }
    
    func testCitiesCountFromCoreData(){
        
        XCTAssertNotNil(cities)
        for item in cities {
            cityStore.update(cityViewModel: item)
        }
        
        XCTAssertNotNil(cityStore.lastTenCity)
        XCTAssertEqual(cityStore.lastTenCity.count, 5)
    }
    
    func testCitiesFetchOrderFromCoreData(){

        XCTAssertNotNil(cities)

        if cityStore.lastTenCity.count == 0 {
            for item in cities {
                cityStore.update(cityViewModel: item)
            }
        }

        XCTAssertNotNil(cityStore.lastTenCity)
//        XCTAssertEqual(cityStore.lastTenCity.first?.name, "Yorkeys Knob")
    }
    
}
