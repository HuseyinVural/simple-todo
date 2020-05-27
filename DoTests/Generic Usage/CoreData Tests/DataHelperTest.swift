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

/// DataHelper altında çok soyutlanmış bir yapım yok, daha kapsamlı bir planda elbette olabilir
/// Bu durum altında hali hazırda SDK içinde test edilmiş olan CoreData işlemlerini, *inMemory* *geçici* bir store a alıp temel task işlemlerini test ediyoruz.
/// Unit'in biraz dışına çıkmış olabilir hiç olmamasındansa önemli olduğunu düşündüğüm bu alanı *Unit* ve *Integretion* arası bir yapı ile hızlıca test etmek istedim
class DataHelperTest: XCTestCase {
  
  override func setUpWithError() throws {
    let spyCoreDataStack = CoreDataStack()
    spyCoreDataStack.customConteiner = GenericTestDouble().spyPersistantContainer
    CoreDataStack.shared = spyCoreDataStack
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
  }
  
  func test_WhenCallTaskStoreMethodeWithNewObject_ThenDidCreateTask() throws {
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
  
  func test_WhenCallTaskStoreMethodeWithExitisObject_ThenDidUpdateTask() throws {
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
  
  func test_WhenCallTaskGetAllMethode_ThenDidSetFetchConttroler() throws {
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
  
  func test_WhenCallTaskDeleteMethode_ThenDidRemoveTask() throws {
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
