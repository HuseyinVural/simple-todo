//
//  TaskListTaskCellViewMadelable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

protocol TaskListTaskCellViewModelable {
  var task: Task { get set }
  var doneAction: ((_ task: Task) -> Void)? { get set }
  var titleAttributedText: NSAttributedString? { get }
  var spot: String? { get }
  var boderWidth: CGFloat { get }
  var imageTintColor: UIColor { get }
  var typeBackground: UIColor { get }
  var typeBordercolor: UIColor { get }
  var categoryBackground: UIColor { get }
  var coverImage: UIImage? { get }
}
