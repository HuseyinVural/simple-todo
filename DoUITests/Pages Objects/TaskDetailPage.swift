//
//  TaskDetailPage.swift
//  DoUITests
//
//  Created by Hüseyin Vural on 28.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest

class TaskDetailPage: Page {
  var app: XCUIApplication
  
  var view: XCUIElement?
  
  required init(app: XCUIApplication) {
    self.app = app
  }
  
  var doneButton: XCUIElement {
    return app.buttons["XC_Done_Button"]
  }
  
  var titleField: XCUIElement {
    return app.textFields["XC_TaskTitle"]
  }
  
  var descTextView: XCUIElement {
    return app.textViews["XC_TaskDesc"]
  }
  
  var backButton: XCUIElement {
    return app.navigationBars.buttons["Back"]
  }
  
  var delete: XCUIElement {
    return app.navigationBars.buttons["Delete"]
  }
  
  var errorPopup: XCUIElement {
    return app.otherElements["ErrorPopup"]
  }
  
  @discardableResult
  func setTitleText(text: String) -> TaskDetailPage {
    self.titleField.tap()
    self.titleField.clearAndEnterText(text: text)
    return self
  }
  
  @discardableResult
  func setDescText(text: String) -> TaskDetailPage {
    self.descTextView.tap()
    UIPasteboard.general.string = text
    self.descTextView.press(forDuration: 1.1)
    app.menuItems["Paste"].tap()
    return self
  }
  
  @discardableResult
  func tapDoneButton() -> TaskDetailPage {
    app.swipeUp()
    self.doneButton.tap()
    return self
  }
}
