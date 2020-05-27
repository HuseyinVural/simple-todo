//
//  AllTaskViewControllerTest.swift
//  DoTests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import Do

class AllTaskViewControllerTest: XCTestCase {
  
  func test_WhenCallViewDidLoad_ThenDidCallBindActions() throws {
    let sut = ViewControllers.allTask
    let spyModel = GenericTestDouble.SpyAllTaskViewModel()
    sut.viewModel = spyModel
    sut.loadView()
    sut.viewDidLoad()
    
    XCTAssertTrue(sut.tableView.delegate is AllTaskTableDelegateObject, "TableView delegate was not set.")
    XCTAssertTrue(sut.tableView.dataSource is AllTaskTableDataSourceObject, "TableView datasource object was not set.")
    XCTAssertTrue(sut.calendar.delegate is CalendarDelegate, "Calendar delegate was not set.")
    XCTAssertEqual(spyModel.loadTaskCallCount, 1, "loadTask call count is not correct")
    XCTAssertEqual(spyModel.setMonthCallCount, 1, "loadTask call count is not correct")
    XCTAssertNotNil(spyModel.dataLoaded, "DataLoaded closure was not set.")
    XCTAssertNotNil(spyModel.changeMonth, "changeMonth closure was not set.")
    XCTAssertNotNil(spyModel.updateEmptyAreaVisibility, "updateEmptyAreaVisibility closure was not set.")
    XCTAssertNotNil(spyModel.pushViewController, "pushViewController closure was not set.")
  }
  
  func test_WhenCallDataLoadedClosure_ThenDidReloadTableView() throws {
    //Given
    let spyTableView = GenericTestDouble.SpyTableView(frame: UIScreen.main.bounds)
    let asyncExpectation = expectation(description: #function)
    let sut = ViewControllers.allTask
    sut.tableView = spyTableView
    spyTableView.restorationIdentifier = ""
    
    sut.dataUpdated()()
    
    //When
    DispatchQueue.main.async {
      asyncExpectation.fulfill()
    }
    
    //Then
    waitForExpectations(timeout: 1, handler: nil)
    XCTAssertEqual(1, spyTableView.reloadDataCallCount, "Data reload logic is wrong")
  }
  
  func test_WhenCallChangeMonthClosure_ThenDidChangeLabel() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut = ViewControllers.allTask
    sut.loadView()
    sut.viewDidLoad()
    let expectedText = "TestText"
    
    //When
    sut.changeMonth()(expectedText)
    
    DispatchQueue.main.async {
      asyncExpectation.fulfill()
      XCTAssertEqual(sut.monthTitle.text, expectedText, "Change month logic is not working.")
    }
    
    //Then
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func test_WhenCallUpdateEmptyAreaVisibilityClosure_ThenDidChangeViewState() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut = ViewControllers.allTask
    sut.loadView()
    sut.viewDidLoad()
    
    //When
    sut.updateEmptyAreaVisibility()(true)
    
    DispatchQueue.main.async {
      asyncExpectation.fulfill()
      XCTAssertEqual(sut.emptyStateArea.isHidden, true, "Empty area visibility logic is not working.")
    }
    
    //Then
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func test_WhenCallAddNewActionMethode_ThenDidCallViewModelMethode() throws {
    //Given
    let sut = ViewControllers.allTask
    let spyModel = GenericTestDouble.SpyAllTaskViewModel()
    sut.viewModel = spyModel
    sut.loadView()
    sut.viewDidLoad()

    //When
    sut.addNewAction(self)
    
    //Then
    XCTAssertEqual(spyModel.showNewTaskDetailCallCount, 1, "This logic is not correct.")

  }
}
