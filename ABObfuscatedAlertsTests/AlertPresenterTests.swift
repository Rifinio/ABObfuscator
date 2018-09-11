//
//  AlertPresenterTests.swift
//  ABObfusctaedAlertsTests
//
//  Created by Adil Bougamza on 11/09/2018.
//  Copyright © 2018 Adil BOUGAMZA. All rights reserved.
//

import XCTest
@testable import ABObfuscatedAlerts

class AlertPresenterTests: XCTestCase {

    var alertPresenter: AlertPresenter!

    override func setUp() {
        super.setUp()
        alertPresenter = AlertPresenter()
    }

    override func tearDown() {
        alertPresenter = nil
        super.tearDown()
    }

    func testAlertPresenterHasCorrectTitleAndMessage() {
        //given
        let viewController = UIViewController()
        let title = "title"
        let message = "message"

        //when
        alertPresenter.showAlert(from: viewController, title: title, message: message, actions: nil, completion: nil)

        //then
        XCTAssertEqual(alertPresenter.alertController.title, title)
        XCTAssertEqual(alertPresenter.alertController.message, message)
    }

    func testAlertPresenterHasNoActions() {
        //given
        let viewController = UIViewController()
        let title = "title"
        let message = "message"

        //when
        alertPresenter.showAlert(from: viewController, title: title, message: message, actions: nil, completion: nil)

        //then
        XCTAssertEqual(alertPresenter.alertController.actions.count, 0)
    }

    func testAlertPresenterHasCorrectActionsCount() {
        //given
        let viewController = UIViewController()
        let title = "title"
        let message = "message"
        let action1 = UIAlertAction(title: "", style: .cancel, handler: nil)
        let action2 = UIAlertAction(title: "", style: .default, handler: nil)

        //when
        alertPresenter.showAlert(from: viewController, title: title, message: message, actions: [action1, action2], completion: nil)

        //then
        XCTAssertEqual(alertPresenter.alertController.actions.count, 2)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}
