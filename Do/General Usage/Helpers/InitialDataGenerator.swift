//
//  InitialDataGenerator.swift
//  Do
//
//  Created by Hüseyin Vural on 28.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import CoreData

/// I haven't made a comprehensive study on UI tests and a plan for test data yet because
/// I create fake data for the tests when the UI test starts with dummy logic
class InitialDataGenerator {
  static func install() {
    if ProcessInfo.processInfo.arguments.contains("IS_RUNNING_UITEST") {
      let dataHelper = DataHelper()
      
      dataHelper.storeTask(task: Task(title: "UI Test Bir", date: Date()))
      dataHelper.storeTask(task: Task(title: "UI Test İki ", date: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()))
    }
  }
}
