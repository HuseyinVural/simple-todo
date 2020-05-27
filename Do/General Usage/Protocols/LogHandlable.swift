//
//  LogHandlable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol LogHandlable {
  func storeLog(_ error: Error, additionalInfo: [String: String])
}
