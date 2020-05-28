//
//  AllTaskViewModelTest.swift
//  DoTests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import Do

class AllTaskViewModelTest: XCTestCase {
  
  func test_WhenCallInit_ThenDidSetTableAndCalendarDelegate() throws {
    //Given //When
    let sut = AllTaskViewModel()
    
    //Then
    XCTAssertNotNil(sut.calendarDelegate, "Caledar delegate was not added.")
    XCTAssertNotNil(sut.tableDelegate, "Caledar delegate was not added.")
  }
  
  func test_WhenCallSetMonth_ThenDidCallChangeMonthClosure() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut = AllTaskViewModel()
    let data = Date()
    
    //Then
    sut.changeMonth = { date in
      asyncExpectation.fulfill()
      XCTAssertTrue(true)
    }
    
    //When
    sut.setMonth(data: data)
    
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func test_WhenLoadTaskMethod_ThenCallDataUpdateClosure() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut = AllTaskViewModel()
    sut.dataHelper = GenericTestDouble.DummyTaskDataOp()
    //Then
    sut.dataLoaded = {
      asyncExpectation.fulfill()
      XCTAssertTrue(true, "Closure not called")
    }
    
    //When
    sut.loadTask()
    
    waitForExpectations(timeout: 1, handler: nil)
  }
}
