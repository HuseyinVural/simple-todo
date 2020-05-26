//
//  Storyboards.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

struct Storyboards {
  private enum Name: String {
    case main = "Main"
  }
  
  static var main: UIStoryboard {
    return makeStoryboard(from: Name.main.rawValue)
  }
}

extension Storyboards {
  static func makeStoryboard(from name: String, _ bundle: Bundle? = nil) -> UIStoryboard {
    return UIStoryboard(name: name, bundle: bundle)
  }
}
