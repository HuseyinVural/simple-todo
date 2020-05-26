//
//  TaskTypesCell.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskTypesCell: UICollectionViewCell, Configurable {
  typealias Model = TaskTypes
  
  @IBOutlet weak var capsuleView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var imageCapsule: UIView!
  @IBOutlet weak var indicatorView: IndicatorView!

  func configure(data: TaskTypes?) {
    guard let data = data else { return }
    
    self.indicatorView.fillColor = data.color
    self.capsuleView.backgroundColor = data.color
    self.titleLabel.text = data.title
    self.imageView.image = data.image
    self.imageView.tintColor = data.color
  }
}
