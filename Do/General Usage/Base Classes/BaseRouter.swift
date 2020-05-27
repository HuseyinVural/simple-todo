//
//  BaseRouter.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter: Routable {
  var dataLoaded: (() -> Void)?
  var updateEmptyAreaVisibility: ((Bool) -> Void)?
  var pushViewController: ((UIViewController) -> Void)?
}
