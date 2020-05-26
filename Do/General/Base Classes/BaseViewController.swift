//
//  BaseViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigationBar()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    installBackButton()
  }
  
  func installBackButton() {
    DispatchQueue.main.async {
      let yourBackImage = Images.back_icon.withInsets(UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 0))
      self.navigationController?.navigationBar.backIndicatorImage = yourBackImage
      self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
      self.navigationController?.navigationBar.backItem?.title = ""
    }
  }
  
  func setNavigationBar() {
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.isTranslucent = true
    self.navigationController?.view.backgroundColor = UIColor.clear
  }
}

extension UIImage {
  func withInsets(_ insets: UIEdgeInsets) -> UIImage? {
    UIGraphicsBeginImageContextWithOptions(
      CGSize(width: size.width + insets.left + insets.right,
             height: size.height + insets.top + insets.bottom),
      false,
      self.scale)
    
    let origin = CGPoint(x: insets.left, y: insets.top)
    self.draw(at: origin)
    let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return imageWithInsets
  }
}
