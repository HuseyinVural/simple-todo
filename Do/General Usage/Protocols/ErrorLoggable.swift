//
//  ErrorLoggable.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol ErrorLoggable {
  func log(_ message: String, with additionalInfo: [String: String])
  func log(_ error: Error, with additionalInfo: [String: String])
}
