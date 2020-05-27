//
//  AllTasksPage.swift
//  DoUITests
//
//  Created by Hüseyin Vural on 28.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest

class AllTasksPage: Page {
  var app: XCUIApplication
  
  var view: XCUIElement?
  
  required init(app: XCUIApplication) {
    self.app = app
  }
  
  var navigationBarAddButton: XCUIElement { return app.navigationBars.buttons["Add"] }
  var firstTaskCell: XCUIElement { return app.tables.cells.firstMatch }
  var firstTaskTitle: XCUIElement { return firstTaskCell.staticTexts.firstMatch }
  
  func tapNavigationBarAddButton() -> TaskDetailPage {
    navigationBarAddButton.tap()
    return TaskDetailPage(app: app)
  }
  
  func tapFirstTaskCell() -> TaskDetailPage {
    firstTaskCell.tap()
    return TaskDetailPage(app: app)
  }
}
