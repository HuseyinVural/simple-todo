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

class BaseViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.installDefaultNavigationBar()
    navigationController?.installBackButton()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  func showSuccessHud() {
    KRProgressHUD.showSuccess()
    AudioServicesPlaySystemSound(Constants.vibration)
  }
  
  deinit {
    print("Deinit Init \(self)")
  }
}

extension BaseViewController {
  final func pushViewController() -> (_ viewController: UIViewController) -> Void {
    return { [weak self] viewController in
      DispatchQueue.main.async {
        guard let self = self else { return }
        self.navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }
}
