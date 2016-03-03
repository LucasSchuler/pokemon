//
//  pokemonTests.swift
//  pokemonTests
//
//  Created by Lucas Fraga Schuler on 29/02/16.
//  Copyright © 2016 Lucas Fraga Schuler. All rights reserved.
//

import XCTest
@testable import pokemon

class pokemonTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoginSuccess() {
        let server = ServerConnection()
        server.login("ash", password: "mistyS2") { (success, message) -> Void in
            XCTAssertTrue(success == true);
        }
    }
    
    func testLoginFail() {
        let server = ServerConnection()
        server.login("login", password: "pass") { (success, message) -> Void in
            XCTAssertFalse(success == true);
        }
    }
}
