//
//  LoginPageObject.swift
//  MockingDemoUserInterfaceTests
//
//  Created by Yasuhiro Yoshida on 2022-02-06.
//

import UIKit
import XCTest

class LoginPageObject {
  var app: XCUIApplication

  init(app: XCUIApplication) {
    self.app = app
  }

  var usernameTextField: XCUIElement { app.textFields["usernameTextField"] }
  var passwordTextField: XCUIElement { app.textFields["passwordTextField"] }
  var loginButton: XCUIElement { app.buttons["loginButton"] }
  var errorMessage: XCUIElement { app.staticTexts["errorMessage"] }
  var dashboardNavigationTitle: XCUIElement { app.staticTexts["Dashboard"] }
}
