//
//  BaseViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import KRProgressHUD
import PopupDialog
import AudioToolbox
import os.log

class BaseViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.installDefaultNavigationBar()
    navigationController?.installBackButton()
  }

  func showSuccessHud() {
    KRProgressHUD.showSuccess()
    AudioServicesPlaySystemSound(Constants.vibration)
  }
  
  deinit {
    os_log("Deinit Init %@", self)
  }
}

extension BaseViewController {
  final func pushViewController() -> (_ viewController: UIViewController) -> Void {
    return { [weak self] viewController in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
}
