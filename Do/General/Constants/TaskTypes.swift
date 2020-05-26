//
//  TaskTypes.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

enum TaskTypes: String, CaseIterable {
  case shop, date, mission
  
  var image: UIImage {
    switch self {
    case .shop:
      return Images.shop_icon
    case .date:
      return Images.gift_icon
    case .mission:
      return Images.mission_icon
    }
  }
  
  var title: String {
    switch self {
    case .shop:
      return "Shop"
    case .date:
      return "Special Day"
    case .mission:
      return "Yes Sir"
    }
  }
  
  var color: UIColor {
    switch self {
    case .shop:
      return UIColor.getirPurple
    case .date:
      return UIColor.orangeish
    case .mission:
      return UIColor.sofYellow
    }
  }
}
