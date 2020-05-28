//
//  DataHelper.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import CoreData

protocol TaskDataOperation {
  func storeTask(task: Task)
  func getAllTask(start: Date, end: Date?, completion: @escaping (() -> Void))
  func hasTask(id: UUID) -> Bool
  func deleteTask(id: UUID, completion: @escaping (() -> Void))
  var taskListFetchController: NSFetchedResultsController<TaskEntity> { get }
}

class DataHelper: TaskDataOperation {
  let logger: ErrorLoggable = ErrorLogger(logHandler: LogHandler())
  
  public func storeTask(task: Task) {
    let context = CoreDataStack.shared.persistentContainer.viewContext
    context.performAndWait {
      context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy

      do {
        if hasTask(id: task.id) {
          try update(task: task, context: context)
        } else {
          try insert(task: task, context: context)
        }
        try context.save()
      } catch {
        logger.log(error, with: ["info": "Function: \(#function), line: \(#line)"])
      }
    }
  }
  
  private func insert(task: Task, context: NSManagedObjectContext) throws {
    let taskEntity = TaskEntity(context: context)
    taskEntity.loadProperties(task: task)
    context.insert(taskEntity)
  }
  
  private func update(task: Task, context: NSManagedObjectContext) throws {
    let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
    req.predicate = TaskEntity.Predicates.getTasksWithID(id: task.id).query
    if let object = try req.execute().first {
      object.loadProperties(task: task)
    }
  }
  
  public func getAllTask(start: Date, end: Date?, completion: @escaping (() -> Void)) {
    let context = CoreDataStack.shared.persistentContainer.viewContext
    taskListFetchController.fetchRequest.predicate = TaskEntity.Predicates.getTasks(start: start.startOfDay, end: end?.endOfDay).query
    
    context.performAndWait {
      do {
        try self.taskListFetchController.performFetch()
        completion()
      } catch {
        completion()
        logger.log(error, with: ["info": "Function: \(#function), line: \(#line)"])
      }
    }
  }
  
  public func hasTask(id: UUID) -> Bool {
    let context = CoreDataStack.shared.persistentContainer.viewContext
    let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
    req.predicate = TaskEntity.Predicates.getTasksWithID(id: id).query
    req.resultType = .countResultType
    do {
      return try context.count(for: req) > 0
    } catch {
      logger.log(error, with: ["info": "Function: \(#function), line: \(#line)"])
    }
    
    return false
  }
  
  public func deleteTask(id: UUID, completion: @escaping (() -> Void)) {
    let context = CoreDataStack.shared.persistentContainer.viewContext
    let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
    req.predicate = TaskEntity.Predicates.getTasksWithID(id: id).query
    context.performAndWait {
      do {
        if let object = try req.execute().first {
          context.delete(object)
        }
        try context.save()
        completion()
      } catch {
        completion()
        logger.log(error, with: ["info": "Function: \(#function), line: \(#line)"])
      }
    }
  }
  
  public lazy var taskListFetchController: NSFetchedResultsController<TaskEntity> = {
    let contex = CoreDataStack.shared.persistentContainer.viewContext
    let req: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
    let sortByTitle = NSSortDescriptor(key: "startDate", ascending: true)
    req.sortDescriptors = [sortByTitle]
    req.returnsObjectsAsFaults = false
    req.fetchLimit = 200
    return NSFetchedResultsController(fetchRequest: req, managedObjectContext: contex, sectionNameKeyPath: "startDate", cacheName: nil)
  }()
}
