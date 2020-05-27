//
//  BaseTaskTableDataSourceObjectTest.swift
//  DoTests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import Do
import CoreData

class BaseTaskTableDataSourceObjectTest: XCTestCase {
  func test_WhenCallNumberOfSections_ThenDidReturnCorrectVal() throws {
    //Given
    let stubLister = GenericTestDouble.StubTaskLister()
    let sut = BaseTaskTableDataSourceObject(viewModel: stubLister)
    
    //When
    stubLister.numberOfSectionsFakeValue = 8
    let section = sut.numberOfSections(in: UITableView())
    
    //Then
    XCTAssertEqual(section, stubLister.numberOfSectionsFakeValue, "Value is not corrent")
  }
  
  func test_WhenCallNumberOfRowsInSection_ThenDidReturnCorrectVal() throws {
    //Given
    let stubLister = GenericTestDouble.StubTaskLister()
    let sut = BaseTaskTableDataSourceObject(viewModel: stubLister)
    
    //When
    stubLister.numberOfRowsInSectionFakeValue = 5
    let rowsOfSection = sut.tableView(UITableView(), numberOfRowsInSection: 0)
    
    //Then
    XCTAssertEqual(rowsOfSection, stubLister.numberOfRowsInSectionFakeValue, "Rows value is not corrent")
  }
}
