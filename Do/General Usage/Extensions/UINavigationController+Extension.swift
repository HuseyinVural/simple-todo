//
//  UINavigationController+Extension.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

extension UINavigationController {
  func installBackButton() {
    DispatchQueue.main.async {
      let yourBackImage = Images.back_icon.withInsets(UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0))
      self.navigationBar.backIndicatorImage = yourBackImage
      self.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
      self.navigationBar.backItem?.title = ""
    }
  }
  
  func installDefaultNavigationBar() {
    DispatchQueue.main.async {
      self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
      self.navigationBar.shadowImage = UIImage()
      self.navigationBar.isTranslucent = true
      self.view.backgroundColor = UIColor.clear
    }
  }
}
