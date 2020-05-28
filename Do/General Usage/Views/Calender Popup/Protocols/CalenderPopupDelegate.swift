//
//  CalenderPopupDelegate.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation
import FSCalendar

protocol CalenderPopupDelegate: AnyObject {
  func calendar(_ calender: FSCalendar, selectedDate: Date)
}
