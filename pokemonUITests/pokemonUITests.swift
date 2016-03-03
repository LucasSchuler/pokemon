//
//  pokemonUITests.swift
//  pokemonUITests
//
//  Created by Lucas Fraga Schuler on 29/02/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import XCTest

class pokemonUITests: XCTestCase {
        
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
    
    func testViewControllerSucess() {
        let app = XCUIApplication()
        let loginTextField = app.textFields["Login"]
        loginTextField.tap()
        loginTextField.typeText("ash")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("mistyS2")
        
        app.buttons["Login"].tap()
        app.tables.staticTexts["Bulbasaur"].tap()
        app.navigationBars["pokemon.DetailView"].childrenMatchingType(.Button).matchingIdentifier("Back").elementBoundByIndex(0).tap()
        
    }
    
    func testViewControllerFail(){
        XCUIApplication().buttons["Login"].tap()
        
    }
    
    func testTypeNone(){
        let app = XCUIApplication()
        let loginTextField = app.textFields["Login"]
        loginTextField.tap()
        loginTextField.typeText("ash")
        
        let passwordTextField = app.textFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("mistyS2")
        
        app.buttons["Login"].tap()
        app.tables.staticTexts["Pikachu"].tap()
    }
    
}
