//
//  XorObfuscatorTests.swift
//  ABObfuscatedAlertsTests
//
//  Created by Adil Bougamza on 11/09/2018.
//  Copyright © 2018 Adil BOUGAMZA. All rights reserved.
//

@testable import ABObfuscatedAlerts
import XCTest

class XorObfuscatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    // test that using different salts generates different obfuscated codes
    func testObfuscatedStringIsCorrectWithDifferentSalts() {
        // given
        let originalText = "hello world"
        let xorObfuscator1 = XorObfuscator(salt: "thisIsSalt1")
        let xorObfuscator2 = XorObfuscator(salt: "aDifferentSalt")
        
        // when
            // obfuscate using two salts
        let obfuscatedKey1 = xorObfuscator1.obfuscate(string: originalText)
        let obfuscatedKey2 = xorObfuscator2.obfuscate(string: originalText)
            // deobfuscate using two salts
        let deobfuscatedText1 = xorObfuscator1.deobfuscate(key: obfuscatedKey1)
        let deobfuscatedText2 = xorObfuscator2.deobfuscate(key: obfuscatedKey2)

        // then
            // assert keys are correct
        XCTAssertEqual(obfuscatedKey1, [28, 13, 5, 31, 38, 83, 36, 14, 30, 24, 85])
        XCTAssertEqual(obfuscatedKey2, [9, 33, 5, 10, 9, 69, 5, 10, 28, 24, 55])
            // keys generated are different
        XCTAssertTrue(obfuscatedKey1 != obfuscatedKey2)
            // deobfuscated strings are the same as the original
        XCTAssertEqual(deobfuscatedText1, originalText)
        XCTAssertEqual(deobfuscatedText2, originalText)
    }

    // Test that using different salt cannot reveal the original text
    func testDeobfuscateUsingDifferentSaltShouldFail() {
        // given
        let originalText = "hello world"
        let correctSalt = "thisIsTheCorrectSalt"
        let wrongSalt = "WrongSalt"

        let xorObfuscatorCorrect = XorObfuscator(salt: correctSalt)
        let xorObfuscatorWrong = XorObfuscator(salt: wrongSalt)
        let obfuscatedString = xorObfuscatorCorrect.obfuscate(string: originalText)

        // when
        let deobfuscatedUsingCorrectSaltString = xorObfuscatorCorrect.deobfuscate(key: obfuscatedString)
        let deobfuscatedUsingWrongSaltString = xorObfuscatorWrong.deobfuscate(key: obfuscatedString)

        // then
        XCTAssertEqual(deobfuscatedUsingCorrectSaltString, originalText)
        XCTAssertTrue(deobfuscatedUsingWrongSaltString != originalText)
    }
}
