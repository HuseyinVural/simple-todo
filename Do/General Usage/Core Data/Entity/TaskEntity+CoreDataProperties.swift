//
//  TaskEntity+CoreDataProperties.swift
//  
//
//  Created by Hüseyin Vural on 26.05.2020.
//
//

import Foundation
import CoreData

extension TaskEntity {
  @nonobjc
  public class func fetchRequest() -> NSFetchRequest<TaskEntity> {
    return NSFetchRequest<TaskEntity>(entityName: "TaskEntity")
  }
  
  @NSManaged public var id: UUID
  @NSManaged public var title: String
  @NSManaged public var desc: String?
  @NSManaged public var taskCategory: String?
  @NSManaged public var taskType: String?
  @NSManaged public var date: NSDate
  @NSManaged public var startDate: Date
  @NSManaged public var isDone: Bool
}

extension TaskEntity {
  func loadProperties(task: Task) {
    self.id = task.id
    self.title = task.title
    self.desc = task.desc
    self.taskCategory = task.taskCategory?.rawValue
    self.taskType = task.taskType?.rawValue
    self.date = task.date as NSDate
    self.startDate = task.startDate
    self.isDone = task.done
  }

  var dto: Task {
    return Task(id: id,
                title: title,
                desc: desc,
                taskCategory: TaskCategories(rawValue: taskCategory ?? ""),
                taskType: TaskTypes(rawValue: taskType ?? ""),
                date: date as Date,
                done: isDone)
  }
}

extension TaskEntity {
  enum Predicates {
    case getTasks(start: Date, end: Date?)
    case getTasksWithID(id: UUID)
    
    var query: NSPredicate {
      switch self {
      case .getTasks(let start, let end):
        if let endDate = end {
          return NSPredicate(format: "date >= %@ AND date =< %@", argumentArray: [start, endDate])
        } else {
          return NSPredicate(format: "date >= %@", argumentArray: [start])
        }
      case .getTasksWithID(let id):
        return NSPredicate(format: "id == %@", argumentArray: [id])
      }
    }
  }
}
