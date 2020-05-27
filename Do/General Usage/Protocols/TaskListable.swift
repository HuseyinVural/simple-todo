//
//  TaskListable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol TaskListable: Routable {
  var dataHelper: TaskDataOperation { get set }
  var tableDataSource: TaskTableDataSource? { get set }
  var tableDelegate: TaskTableDelegate? { get set }
  
  var numberOfSections: Int { get }
  
  func numberOfRowsInSection(numberOfRowsInSection section: Int) -> Int
  func cellModel(indexPath: IndexPath) -> Task
  
  func showNewTaskDetail(selectedDate: Date?)
}
