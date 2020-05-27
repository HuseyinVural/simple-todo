//
//  Page.swift
//  DoUITests
//
//  Created by Hüseyin Vural on 28.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest

protocol Page {
  var app: XCUIApplication { get }
  var view: XCUIElement? { get }
  
  init(app: XCUIApplication)
}
