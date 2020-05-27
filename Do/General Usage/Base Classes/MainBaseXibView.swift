//
//  MainBaseXibView.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class MainBaseXibView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.fromNib()
    self.viewDidLoad()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.fromNib()
    self.viewDidLoad()
  }
  
  func viewDidLoad() {
  }
}
