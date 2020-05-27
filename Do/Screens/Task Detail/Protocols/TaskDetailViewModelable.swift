//
//  TaskDetailViewModelable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

import FSCalendar

protocol TaskDetailViewModelable: CalenderPopupDelegate {
  var task: Task { get set }
  var confirmTitle: String { get }
  var title: String { get }
  var changedSelectedDataLabel: ((_ date: String) -> Void)? { get set }
  
  func setTaskCategories(category: TaskCategories)
  func setTaskType(type: TaskTypes)
  
  func save(title: String?, desc: String?, success: () -> Void, error: (_ message: String) -> Void)
  func delete(success: @escaping () -> Void)
}
