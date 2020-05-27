//
//  Routable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import UIKit

protocol Routable: AnyObject {
  var pushViewController: ((UIViewController) -> Void)? { get set }
  var dataLoaded: (() -> Void)? { get set }
  var updateEmptyAreaVisibility: ((Bool) -> Void)? { get set }
}
