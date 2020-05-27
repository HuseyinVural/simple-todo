//
//  TaskListTaskCell.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import AudioToolbox

class TaskListTaskCell: UITableViewCell, Configurable {
  
  typealias Model = Task
  
  var viewModel: TaskListTaskCellViewModelable!
  
  @IBOutlet weak var imageAreaCapsule: UIView!
  @IBOutlet weak var typeImage: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var spotLabel: UILabel!
  @IBOutlet weak var categoryView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  func configure(data: Task?) {
    guard let data = data else { return }
    self.viewModel = TaskListTaskCellViewModel(data: data)
    
    DispatchQueue.main.async {
      self.titleLabel.attributedText = self.viewModel.titleAttributedText
      self.imageAreaCapsule.layer.borderWidth = self.viewModel.boderWidth
      self.typeImage?.tintColor = self.viewModel.imageTintColor
      self.typeImage?.image = self.viewModel.coverImage
      self.spotLabel.text = self.viewModel.spot
      self.categoryView.backgroundColor = self.viewModel.categoryBackground
      
      self.imageAreaCapsule.backgroundColor = self.viewModel.typeBackground
      self.imageAreaCapsule.layer.borderColor = self.viewModel.typeBordercolor.cgColor
    }
  }
  
  @IBAction func tapDoneAction(_ sender: Any) {
    self.viewModel.task.done.toggle()
    self.viewModel.doneAction?(self.viewModel.task)
    AudioServicesPlaySystemSound(Constants.vibration)
  }
}
