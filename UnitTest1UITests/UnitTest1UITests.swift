//
//  UnitTest1UITests.swift
//  UnitTest1UITests
//
//  Created by luckyxmobile on 16/9/22.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import XCTest

class UnitTest1UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testButtonClick() {
        
        
        let app = XCUIApplication()
        let upButton = app.buttons["up"]
        upButton.tap()
        
        let rightButton = app.buttons["right"]
        rightButton.tap()
        
        let downButton = app.buttons["down"]
        downButton.tap()
        
        let leftButton = app.buttons["left"]
        leftButton.tap()
        upButton.tap()
        rightButton.tap()
        downButton.tap()
        leftButton.tap()
        
//        let app  = XCUIApplication()
//        let upButton = app.buttons["up"]
//        let downButton = app.buttons["down"]
//        let rightButton = app.buttons["right"]
//        let leftButton = app.buttons["left"]
//        upButton.tap()
//        downButton.tap()
//        rightButton.tap()
//        leftButton.tap()
    }
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
