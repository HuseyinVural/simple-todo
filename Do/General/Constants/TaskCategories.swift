//
//  TaskCategories.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

enum TaskCategories: String, CaseIterable {
  case work, family, health, friends, education, law, tax
  
  var color: UIColor {
    switch self {
    case .work:
      return UIColor.hotBlue
    case .family:
      return UIColor.sofYellow
    case .health:
      return UIColor.easyRed
    case .friends:
      return UIColor.successGreen
    case .education:
      return UIColor.hardTurq
    case .law:
      return UIColor.red
    case .tax:
      return UIColor.hardGray
    }
  }
  
  var title: String {
    switch self {
    case .work:
      return "Work"
    case .family:
      return "Family"
    case .health:
      return "Health"
    case .friends:
      return "Friends"
    case .education:
      return "Education"
    case .law:
      return "Law"
    case .tax:
      return "Tax"
    }
  }
}
