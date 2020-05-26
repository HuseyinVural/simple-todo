//
//  Configurable.swift
//  Do
//
//  Created by Hüseyin Vural on 25.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

protocol Configurable {
  associatedtype Model
  func configure(data: Model?)
}
