//
//  SimpleTaskOperationsTestCase.swift
//  DoUITests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest

class SimpleTaskOperationsTestCase: XCTestCase {
  lazy var app: XCUIApplication = {
    let aps = XCUIApplication()
    aps.launchEnvironment = ["animations": "0"]
    aps.launchArguments.append("IS_RUNNING_UITEST")
    return aps
  }()

  func test_WhenCreateNewTaskWitoutTitle_ThenSowError() throws {
    app.launch()
    
    AllTasksPage(app: app).tapNavigationBarAddButton().doneButton.tap()
    XCTAssert(app.otherElements["ErrorPopup"].exists, "Error message not found.")
  }
  
  func test_WhenCreateNewTask_ThenShowTaskInAllTask() throws {
    app.launch()
    
    let allTask = AllTasksPage(app: app)
    let detail = allTask.tapNavigationBarAddButton()
    detail.setTitleText(text: "UI_TEST TASK Title").setDescText(text: "UI_TEST TASK DESC").tapDoneButton().backButton.tap()
    XCTAssert(detail.app.tables.cells.staticTexts["UI_TEST TASK Title"].exists)
  }
  
  func test_WhenChangeTask_ThenShowChangedTaskInAllTask() throws {
    app.launch()
    let newTitle = "Changed Text"
    let allTask = AllTasksPage(app: app)
    allTask.tapFirstTaskCell().setTitleText(text: newTitle).tapDoneButton().backButton.tap()
    
    XCTAssertEqual(allTask.firstTaskTitle.label, newTitle, "Task name was not change.")
  }
  
  func test_WhenDeleteTask_ThenRemoveTaskInAllTaskPage() throws {
    app.launch()
    let allTask = AllTasksPage(app: app)
    let firstCount = allTask.app.tables.cells.count
    allTask.tapFirstTaskCell().delete.tap()

    XCTAssertNotEqual(firstCount, allTask.app.tables.cells.count, "Task was not removed.")
  }
}
