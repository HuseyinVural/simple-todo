//
//  UIView+Extension.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

extension UIView {
  static func identifier() -> String {
    return String(describing: self)
  }
}

extension UIView {
  @discardableResult
  func fromNib<T: UIView>() -> T? {
    guard let contentView = Bundle(for: type(of: self)).loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
      return nil
    }
    
    self.addSubview(contentView)
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
    contentView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    return contentView
  }
}
