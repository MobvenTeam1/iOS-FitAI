//
//  PaswordHelperTests.swift
//  iOS-FitAITests
//
//  Created by Ahmet Yasin Atakan on 17.06.2024.
//

import XCTest
@testable import iOS_FitAI

final class PaswordHelperTests: XCTestCase {
    var passwordHelper: PasswordHelperProtocol!
    
    override func setUp() {
        super.setUp()
        passwordHelper = MockPasswordHelper()
    }
    
    override func tearDown() {
        passwordHelper = nil
    }
    
    func test_createPassword_ifPasswordSuccess() {
        let expectation = self.expectation(description: "Password created successfully")
        passwordHelper.createPassword(password: "123456Aa",
                                      confirmPassword: "123456Aa",
                                      onError: { error in
            XCTFail("Password does not meet requirements: \(error)")
        },
                                      onSuccess: {
            expectation.fulfill()
        })
        waitForExpectations(timeout: 1)
    }
    func test_createPassword_ifPasswordEmpty() {
        let expectation = self.expectation(description: "Password can not be empty.")
        passwordHelper.createPassword(password: "",
                                      confirmPassword: "",
                                      onError: { error in
            XCTAssertEqual(error, "Parola boş kalamaz.")
            expectation.fulfill()
        },
                                      onSuccess: {
            XCTFail("Password creation should give a password can not be empty error. Please check it again.")
        })
        waitForExpectations(timeout: 1)
    }
    
    func test_createPassword_ifPasswordDoesNotMatch() {
        let expectation = self.expectation(description: "Password does not match.")
        passwordHelper.createPassword(password: "123456Aaa",
                                      confirmPassword: "123456Aa",
                                      onError: { error in
            XCTAssertEqual(error, "Parolalarınız eşleşmiyor.")
            expectation.fulfill()
        },
                                      onSuccess: {
            XCTFail("Password creation should give a password dismatch error. Please check it again.")
        })
        waitForExpectations(timeout: 1)
    }
    func test_createPassword_ifPasswordIsWeak() {
        let expectation = self.expectation(description: "Password creation fails due to weak password.")
        passwordHelper.createPassword(password: "123456A", 
                                      confirmPassword: "123456A",
                                      onError: { error in
            XCTAssertEqual(error, "Parola en az 8 karakter uzunluğunda olmalı ve büyük/küçük harf içermelidir.")
            expectation.fulfill()
        }, onSuccess: {
            XCTFail("Password creation should give a password does not meet requirements error. Please check it again.")
        })
        waitForExpectations(timeout: 1)
    }
    
}
