//
//  Cities_of_the_WorldTests.swift
//  Cities of the WorldTests
//
//  Created by Aditya Vikram Godawat on 07/09/18.
//  Copyright © 2018 Aditya Vikram Godawat. All rights reserved.
//

import XCTest
@testable import Cities_of_the_World

class Cities_of_the_WorldTests: XCTestCase {
    
    var systemUnderTest: ViewController!

    override func setUp() {
        super.setUp()

        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        systemUnderTest = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController

        _ = systemUnderTest.view
}
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSUT_CanBeInstantiated() {
        
        XCTAssertNotNil(systemUnderTest)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(2, 2)
    }
    
    //MARK: - Search Bar Tests
    // MARK: - SearchBar
    
    func testSUT_HasSearchBar() {
        
        XCTAssertNotNil(systemUnderTest.searchBar)
    }
    
    func testSUT_ShouldSetSearchBarDelegate() {
        
        XCTAssertNotNil(self.systemUnderTest.searchBar.delegate)
    }

    
    // MARK: - Search Auto-Suggest Behavior
    
    func testSUT_CanProperlyDisplay_CityState_AutoSuggestionsInTableView_AfterSearchTextChanges() {

        systemUnderTest.searchBar(systemUnderTest.searchBar, textDidChange: ".")
        XCTAssertEqual(systemUnderTest.filteredCities.count, 0)

        systemUnderTest.searchBar(systemUnderTest.searchBar, textDidChange: "Udaipur")
        XCTAssertEqual(systemUnderTest.filteredCities.count, 4)
        
        systemUnderTest.searchBar(systemUnderTest.searchBar, textDidChange: "Amsterdam")
        XCTAssertEqual(systemUnderTest.filteredCities.count, 4)
    }
}
