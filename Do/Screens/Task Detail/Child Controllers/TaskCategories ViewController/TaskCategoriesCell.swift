//
//  TaskCategoriesCell.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskCategoriesCell: UICollectionViewCell, Configurable {
  
  typealias Model = TaskCategories
  
  @IBOutlet weak var capsuleView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var indicatorView: IndicatorView!

  func configure(data: TaskCategories?) {
    guard let data = data else { return }
    self.capsuleView.backgroundColor = data.color
    self.indicatorView.fillColor = data.color
    self.titleLabel.text = data.title
  }
  
  override var isSelected: Bool {
    didSet {
      self.indicatorView.isHidden = !self.isSelected
    }
  }
}
