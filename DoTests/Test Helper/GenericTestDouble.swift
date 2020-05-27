//
//  GenericTestDouble.swift
//  DoTests
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import Foundation
import CoreData
@testable import Do

class GenericTestDouble {
  lazy var spyPersistantContainer: NSPersistentContainer = {
    let container = NSPersistentContainer(name: "Do")
    let description = NSPersistentStoreDescription()
    description.type = NSInMemoryStoreType
    description.shouldAddStoreAsynchronously = false
    container.persistentStoreDescriptions = [description]
    container.loadPersistentStores { (description, error) in
      precondition( description.type == NSInMemoryStoreType )
      if let error = error {
        fatalError("Create an in-mem coordinator failed \(error)")
      }
    }
    return container
  }()
  
  class StubTaskLister: TaskListable {
    var numberOfSectionsFakeValue = 3
    var numberOfRowsInSectionFakeValue = 3
    var fakeTask = Task(title: "TestObject", date: Date())
    
    var dataHelper: TaskDataOperation = DummyTaskDataOp()
    
    var tableDataSource: TaskTableDataSource?
    
    var tableDelegate: TaskTableDelegate?
    
    var numberOfSections: Int {
      return numberOfSectionsFakeValue
    }
    
    func numberOfRowsInSection(numberOfRowsInSection section: Int) -> Int {
      return numberOfRowsInSectionFakeValue
    }
    
    func cellModel(indexPath: IndexPath) -> Task {
      return fakeTask
    }
    
    func showNewTaskDetail(selectedDate: Date?) {
      
    }
    
    var pushViewController: ((UIViewController) -> Void)?
    
    var dataLoaded: (() -> Void)?
    
    var updateEmptyAreaVisibility: ((Bool) -> Void)?
  }

  class DummyTaskDataOp: TaskDataOperation {
    func storeTask(task: Task) {
    }
    
    func getAllTask(start: Date, end: Date?, completion: @escaping (() -> Void)) {
      completion()
    }
    
    func hasTask(id: UUID) -> Bool {
      return false
    }
    
    func deleteTask(id: UUID, completion: @escaping (() -> Void)) {
    }
    
    var taskListFetchController: NSFetchedResultsController<TaskEntity> {
      return NSFetchedResultsController<TaskEntity>()
    }
  }
  
  class SpyAllTaskViewModel: AllTaskViewModel {
    var loadTaskCallCount = 0
    var setMonthCallCount = 0
    var showNewTaskDetailCallCount = 0
    
    override func loadTask(start: Date = Date(), end: Date? = Date()) {
      loadTaskCallCount += 1
    }
    
    override func setMonth(data: Date?) {
      setMonthCallCount += 1
    }
    
    override func showNewTaskDetail(selectedDate: Date?) {
      showNewTaskDetailCallCount += 1
    }
  }

  class SpyTableView: UITableView {
    var reloadDataCallCount = 0
    override func reloadData() {
      super.reloadData()
      reloadDataCallCount += 1
    }
  }

}
