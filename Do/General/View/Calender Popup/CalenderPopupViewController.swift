//
//  CalenderPopupViewController.swift
//  Do
//
//  Created by Hüseyin Vural on 26.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import FSCalendar

class CalenderPopupViewController: BaseXIBViewController {
  
  @IBOutlet weak var calender: FSCalendar!
  weak var delegate: CalenderPopupDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func tapSelectAction(_ sender: Any) {
    DispatchQueue.main.async {
      self.dismiss(animated: true, completion: nil)
    }
    delegate?.calendar(calender, selectedDate: calender.selectedDate)
  }
}

extension CalenderPopupViewController: FSCalendarDataSource, FSCalendarDelegate {
  func minimumDate(for calendar: FSCalendar) -> Date {
    return Date()
  }
}
