//
//  TaskDetailViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit

class TaskDetailViewController: BaseViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  @IBAction func tapActionDateArea(_ sender: Any) {
    DispatchQueue.main.async {
      self.present(ViewControllers.calenderPopup, animated: true, completion: nil)
    }
  }
}
