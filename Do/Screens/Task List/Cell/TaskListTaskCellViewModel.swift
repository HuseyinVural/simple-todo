//
//  TaskListTaskCellViewMadel.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskListTaskCellViewModel: TaskListTaskCellViewModelable {
  var task: Task
  var titleAttributedText: NSAttributedString?
  var spot: String?
  var boderWidth: CGFloat = 1
  var imageTintColor: UIColor = UIColor.black
  var categoryBackground: UIColor = UIColor.black
  var coverImage: UIImage?
  var typeBackground: UIColor = UIColor.black
  var typeBordercolor: UIColor = UIColor.black
  var doneAction: ((_ task: Task) -> Void)?
  
  init(data: Task) {
    task = data
    titleAttributedText = titleAttrbutedString(data: data)
    spot = data.date.dateToStirng()
    imageTintColor = UIColor.white
    coverImage = typeImage(data: data)
    typeBackground = typeColor(data: data)
    typeBordercolor = typeBorderColor(data: data)
    categoryBackground = data.taskCategory?.color ?? UIColor.clear
  }
  
  func titleAttrbutedString(data: Task) -> NSAttributedString {
    var attrString = NSMutableAttributedString()
    if data.done {
      attrString = NSMutableAttributedString(attributedString: data.title.strikeThrough())
      attrString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.skeletonGray], range: NSRange(location: 0, length: attrString.length))
    } else {
      attrString = NSMutableAttributedString(string: data.title)
      attrString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.bigBlack], range: NSRange(location: 0, length: attrString.length))
    }
    
    return attrString
  }

  func typeColor(data: Task) -> UIColor {
    if data.done {
      return UIColor.successGreen
    }
    
    if let taskType = data.taskType {
      return taskType.color
    } else {
      return UIColor.clear
    }
  }
  
  func typeBorderColor(data: Task) -> UIColor {
    if data.done {
      return UIColor.successGreen
    }
    
    if let taskType = data.taskType {
      return taskType.color
    } else {
      return UIColor.skeletonGray
    }
  }
  
  func typeImage(data: Task) -> UIImage? {
    if data.done {
      return Images.check_icon
    }
    
    return data.taskType?.image
  }
}
