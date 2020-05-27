//
//  XCUIElement.swift
//  DoUITests
//
//  Created by Hüseyin Vural on 28.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import XCTest

extension XCUIElement {
  func clearAndEnterText(text: String) {
    guard let stringValue = self.value as? String else {
      XCTFail("Tried to clear and enter text into a non string value")
      return
    }
    
    self.tap()
    
    let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: stringValue.count)
    
    self.typeText(deleteString)
    self.typeText(text)
  }
}
