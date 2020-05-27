//
//  TaskSectionHeaderCel.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskSectionHeaderCell: UITableViewCell, Configurable {
  
  @IBOutlet weak var dateTitle: UILabel!
  @IBOutlet weak var dayTitle: UILabel!
  
  typealias Model = Task
  
  var selectAction: (() -> Void)?
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configure(data: Task?) {
    dateTitle.text = data?.date.dateToStirng()
    dayTitle.text = ""
  }
  
  @IBAction func tapShowAllAction(_ sender: Any) {
    selectAction?()
  }
}
