//
//  UIImage+Extension.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

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
