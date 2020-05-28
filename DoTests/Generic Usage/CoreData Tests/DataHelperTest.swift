//
//  DoTests.swift
//  DoTests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest
@testable import Do
import CoreData

/// There is no much-abstracted structure in DataHelper's logic, it is of course possible in a more comprehensive plan.
/// That's why, I'm testing core task operations by moving CoreData processes, which have already been tested in the SDK, to a * inMemory * * temporary * store.
/// It may look slightly different from the unit test rules, I thought that was better than nothing so I wanted to test it quickly by building a structure between * Unit * and * Integration *

class DataHelperTest: XCTestCase {
  
  override func setUpWithError() throws {
    let spyCoreDataStack = CoreDataStack()
    spyCoreDataStack.customConteiner = GenericTestDouble().spyPersistantContainer
    CoreDataStack.shared = spyCoreDataStack
  }
  
  func test_WhenCallTaskStoreMethodWithNewObject_ThenDidCreateTask() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut: DataHelper = DataHelper()
    let task = Task(title: "DummyObjectTestObject", date: Date())
    
    //When
    sut.storeTask(task: task)
    
    //Then
    DispatchQueue.main.async {
      XCTAssert(sut.hasTask(id: task.id), "Task object was not created.")
      asyncExpectation.fulfill()
    }
    
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func test_WhenCallTaskStoreMethodWithExitisObject_ThenDidUpdateTask() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut: DataHelper = DataHelper()
    let task = Task(title: "DummyObjectTestObject", date: Date())
    sut.storeTask(task: task)
    sut.storeTask(task: task)
    sut.storeTask(task: task)

    //When
    let context = CoreDataStack.shared.persistentContainer.viewContext
    let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
    req.predicate = TaskEntity.Predicates.getTasksWithID(id: task.id).query
    req.resultType = .countResultType

    //Then
    DispatchQueue.main.async {
      do {
        let count = try context.count(for: req)
        XCTAssertEqual(count, 1, "Task object logic is problematic.")
      } catch {
        fatalError()
      }
      asyncExpectation.fulfill()
    }
    
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func test_WhenCallTaskGetAllMethod_ThenDidSetFetchController() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut: DataHelper = DataHelper()
    let date = Date()
    sut.storeTask(task: Task(title: "DummyObjectTestObject", date: date))
    sut.storeTask(task: Task(title: "DummyObjectTestObject", date: date))
    sut.storeTask(task: Task(title: "DummyObjectTestObject", date: date))
    
    //When
    sut.getAllTask(start: date, end: nil) {
      //Then
      XCTAssertEqual(sut.taskListFetchController.fetchedObjects?.count, 3, "TaskFatchController was not set.")
      asyncExpectation.fulfill()
    }
    
    waitForExpectations(timeout: 1, handler: nil)
  }
  
  func test_WhenCallTaskDeleteMethod_ThenDidRemoveTask() throws {
    //Given
    let asyncExpectation = expectation(description: #function)
    let sut: DataHelper = DataHelper()
    let date = Date()
    let task = Task(title: "DummyObjectTestObject", date: date)
    sut.storeTask(task: task)
    
    //When
    DispatchQueue.main.async {
      let firstState = sut.hasTask(id: task.id)
      sut.deleteTask(id: task.id) {
        let secondState = sut.hasTask(id: task.id)
        //Then
        XCTAssertEqual(firstState, true, "Task object was not created.")
        XCTAssertEqual(secondState, false, "Task object was not deleted.")
        asyncExpectation.fulfill()
      }
    }
    
    waitForExpectations(timeout: 1, handler: nil)
  }
}
