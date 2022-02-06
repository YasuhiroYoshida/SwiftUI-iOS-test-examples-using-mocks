//
//  MockingDemoUserInterfaceTests.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Yasuhiro Yoshida on 2022-02-06.
//

import XCTest

class WhenUserClicksLoginButton: XCTestCase {
  var app: XCUIApplication!
  var loginPageObject: LoginPageObject!

  override func setUp() {
    app = XCUIApplication()
    loginPageObject = LoginPageObject(app: app)
    continueAfterFailure = true
    app.launchEnvironment = ["ENV": "Test"]
    app.launch()
  }

  func testItShouldDisplayErrorMessagesWhenRequiredFieldsAreNotFilled() {

    loginPageObject.usernameTextField.tap()
    loginPageObject.usernameTextField.typeText("")

    loginPageObject.passwordTextField.tap()
    loginPageObject.passwordTextField.typeText("")

    loginPageObject.loginButton.tap()

    XCTAssertEqual(loginPageObject.errorMessage.label, "Required fields are missing")
  }

  func testItShouldDisplayErrorMessagesWhenRequiredFieldsAreFilledWithInvalidInput() {

    loginPageObject.usernameTextField.tap()
    loginPageObject.usernameTextField.typeText("JohnDoe")

    loginPageObject.passwordTextField.tap()
    loginPageObject.passwordTextField.typeText("WrongPassword")

    loginPageObject.loginButton.tap()

    XCTAssertEqual(loginPageObject.errorMessage.label, "Invalid credentials")
  }

  func testItShouldNavigateToDashboardWhenAuthenticated() {
    loginPageObject.usernameTextField.tap()
    loginPageObject.usernameTextField.typeText("JohnDoe")

    loginPageObject.passwordTextField.tap()
    loginPageObject.passwordTextField.typeText("Password")

    loginPageObject.loginButton.tap()

    XCTAssertTrue(loginPageObject.dashboardNavigationTitle.waitForExistence(timeout: 0.5))
  }
}
