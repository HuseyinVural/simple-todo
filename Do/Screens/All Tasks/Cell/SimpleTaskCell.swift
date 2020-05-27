//
//  SimpleTaskCell.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class SimpleTaskCell: UITableViewCell, Configurable {
  typealias Model = Task
  
  @IBOutlet weak var taskTitle: UILabel!
  @IBOutlet weak var taskCategory: UILabel!
  @IBOutlet weak var taskDate: UILabel!
  @IBOutlet weak var taskTypeColor: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configure(data: Task?) {
    guard let data = data else {
      return
    }
    
    DispatchQueue.main.async {
      self.taskTitle.text = data.title
      self.taskCategory.text = data.taskCategory?.title
      self.taskTypeColor.backgroundColor = data.taskType?.color
      self.taskDate.text = data.date.dateToStirng(format: "h:mm a")
    }
  }
}
