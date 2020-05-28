//
//  BaseTaskFetchControllerDelegateObject.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import CoreData

class BaseTaskFetchControllerDelegateObject: NSObject, TaskFetchControllerDelegate {
  
  unowned var viewModel: TaskListable
  
  init(viewModel: TaskListable) {
    self.viewModel = viewModel
    super.init()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    viewModel.dataLoaded?()
  }
}
