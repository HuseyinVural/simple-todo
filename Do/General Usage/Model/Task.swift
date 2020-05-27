//
//  Task.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

struct Task {
  var id: UUID = UUID()
  var title: String
  var desc: String?
  var taskCategory: TaskCategories?
  var taskType: TaskTypes?
  var date: Date
  var done: Bool = false
  var startDate: Date {
    return date.startOfDay
  }
}
