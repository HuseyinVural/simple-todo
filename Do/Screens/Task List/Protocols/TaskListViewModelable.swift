//
//  TaskListViewModelable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol TaskListViewModelable: TaskListable {
  var targetDate: Date { get set }
  var dateTitle: String { get }
  func loadTask()
  func doneAction() -> (_ model: Task) -> Void
}
