//
//  ViewControlers.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

struct ViewControllers {
  enum Identifier: String {
    case allTask = "AllTaskViewController"
    case calenderPopup = "CalenderPopupViewController"
    case taskDetail = "TaskDetailViewController"
    case taskList = "TaskListViewController"
  }
  
  static var allTask: AllTaskViewController {
    return defineViewController(with: Identifier.allTask.rawValue, from: Storyboards.main)
  }
  
  static var calenderPopup: CalenderPopupViewController {
    let viewController = CalenderPopupViewController()
    viewController.modalTransitionStyle = .coverVertical
    return viewController
  }
  
  static var taskDetail: TaskDetailViewController {
    return defineViewController(with: Identifier.taskDetail.rawValue, from: Storyboards.main)
  }
  
  static var taskList: TaskListViewController {
    return defineViewController(with: Identifier.taskList.rawValue, from: Storyboards.main)
  }
}

extension ViewControllers {
  static func make(with identifier: String, from storyboard: UIStoryboard) -> UIViewController? {
    return storyboard.instantiateViewController(withIdentifier: identifier)
  }
  
  @discardableResult
  static func defineViewController<T: UIViewController>(with identifier: String,
                                                        from storyboard: UIStoryboard,
                                                        of type: T.Type? = nil) -> T {
    
    guard let viewController = make(with: identifier, from: storyboard) as? T else {
      fatalError("Could not define view controller with identifier: \(identifier), from storyboard: \(storyboard)")
    }
    return viewController
  }
}
