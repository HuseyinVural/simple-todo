//
//  CoreDataStackTest.swift
//  DoTests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import Do
import CoreData

class CoreDataStackTest: XCTestCase {
  var saveNotificationCompleteHandler: ((Notification) -> Void)?

  func test_WhenSetCustomContainer_ThenDidChangeStoreType() throws {
    //Given
    let sut = CoreDataStack()
    
    //When
    sut.customConteiner = GenericTestDouble().spyPersistantContainer
    
    //Then
    XCTAssertEqual(sut.persistentContainer.persistentStoreDescriptions.first!.type, NSInMemoryStoreType, "Core data store type was not changed.")
  }
  
  func test_WhenUseInitalCoreDataConteiner_ThenDidReturnCorrentStore() throws {
    //WHEN
    let sut = CoreDataStack()
    
    //THEN
    XCTAssertEqual(sut.persistentContainer.persistentStoreDescriptions.first!.type, NSSQLiteStoreType, "Core data store type was not correct.")
  }
  
  func test_WhenCallSaveContextCahges_ThenDidSaveData() throws {
    //WHEN
    let asyncExpectation = expectation(description: #function)
    let sut = CoreDataStack()
    sut.customConteiner = GenericTestDouble().spyPersistantContainer
    
    NotificationCenter.default.addObserver( self,
    selector: #selector(contextSaved(notification:)),
    name: NSNotification.Name.NSManagedObjectContextDidSave ,
    object: nil )
    
    let task = Task(title: "UnitTestObject", date: Date())
    let context = sut.persistentContainer.viewContext
    let taskEntity = TaskEntity(context: context)
    taskEntity.loadProperties(task: task)
    context.insert(taskEntity)
    
    waitForSavedNotification { (_) in
      asyncExpectation.fulfill()
      XCTAssert(true)
    }
    
    sut.saveContext()
    
    waitForExpectations(timeout: 1, handler: nil)
  }
}

extension CoreDataStackTest {
  func contextSaved( notification: Notification ) {
    saveNotificationCompleteHandler?(notification)
  }
  
  func waitForSavedNotification(completeHandler: @escaping ((Notification) -> Void)) {
      saveNotificationCompleteHandler = completeHandler
  }
}
