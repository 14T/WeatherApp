//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Anand, Chetan [GCB-OT NE] on 19/8/19.
//  Copyright © 2019 World. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("uitesting")
        app.launch()
    }
    
    
    
    override func tearDown() {
        super.tearDown()

    }
    
    func testSearchFieldDisplays() {
        
        let searchFieldExists = app/*@START_MENU_TOKEN@*/.navigationBars/*[[".otherElements[\"UINavigationController\"].navigationBars",".navigationBars"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.searchFields["Type here to search cities ..."].exists
        XCTAssertTrue(searchFieldExists)

        
    }
    
    
    func testTableViewsDisplays() {
        let tableViewExists = app.tables.firstMatch.exists
        XCTAssertTrue(tableViewExists)
    }
    
    func testSearch() {

//        app/*@START_MENU_TOKEN@*/.navigationBars/*[[".otherElements[\"UINavigationController\"].navigationBars",".navigationBars"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.searchFields["Type here to search cities ..."].tap()
//
//        let sKey = app/*@START_MENU_TOKEN@*/.keys["S"]/*[[".otherElements.matching(identifier: \"UIInputWindowController\")",".otherElements.matching(identifier: \"UICompatibilityInputViewController\")",".keyboards[\"UICompatibilityInputViewController\"].keys[\"S\"]",".keys[\"S\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
//        sKey.tap()
//        sKey.tap()
//        app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".otherElements.matching(identifier: \"UIInputWindowController\")",".otherElements.matching(identifier: \"UICompatibilityInputViewController\")",".keyboards[\"UICompatibilityInputViewController\"].keys[\"i\"]",".keys[\"i\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let nKey = app/*@START_MENU_TOKEN@*/.keys["n"]/*[[".otherElements.matching(identifier: \"UIInputWindowController\")",".otherElements.matching(identifier: \"UICompatibilityInputViewController\")",".keyboards[\"UICompatibilityInputViewController\"].keys[\"n\"]",".keys[\"n\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/
//        nKey.tap()
//        nKey.tap()
//        app/*@START_MENU_TOKEN@*/.buttons["search"]/*[[".otherElements.matching(identifier: \"UIInputWindowController\")",".otherElements.matching(identifier: \"UICompatibilityInputViewController\")",".keyboards[\"UICompatibilityInputViewController\"].buttons[\"search\"]",".buttons[\"search\"]"],[[[-1,3],[-1,2],[-1,1,2],[-1,0,1]],[[-1,3],[-1,2],[-1,1,2]],[[-1,3],[-1,2]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.tables.staticTexts["Lancashire"]/*[[".otherElements[\"UINavigationController\"]",".otherElements[\"Weather.SearchViewController\"].tables",".cells.staticTexts[\"Lancashire\"]",".staticTexts[\"Lancashire\"]",".tables"],[[[-1,4,2],[-1,1,2],[-1,0,1]],[[-1,4,2],[-1,1,2]],[[-1,3],[-1,2]]],[0,0]]@END_MENU_TOKEN@*/.tap()
//
//        let weatherCitydetailviewcontrollerElement = app/*@START_MENU_TOKEN@*/.otherElements["Weather.CityDetailViewController"]/*[[".otherElements[\"UINavigationController\"].otherElements[\"Weather.CityDetailViewController\"]",".otherElements[\"Weather.CityDetailViewController\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//
//        XCTAssertTrue(weatherCitydetailviewcontrollerElement.exists)
    }
    
}
