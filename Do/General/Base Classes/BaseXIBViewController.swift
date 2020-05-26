//
//  BaseXIBViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class BaseXIBViewController: UIViewController {
  internal init() {
    super.init(nibName: String(describing: type(of: self)), bundle: .main)
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError()
  }
}
