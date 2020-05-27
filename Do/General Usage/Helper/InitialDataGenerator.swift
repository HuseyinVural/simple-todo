//
//  InitialDataGenerator.swift
//  Do
//
//  Created by Hüseyin Vural on 28.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import UIKit
import CoreData

/// Henüz UI testler üzerinde kapsamlı bir çalışma ve test dataları için bir plan yapmadığım için
/// Bu dummy logic ile UI test başlangıçarında testlerin çalışabilmesi için task oluşturuyorm
class InitialDataGenerator {
  static func install() {
    if ProcessInfo.processInfo.arguments.contains("IS_RUNNING_UITEST") {
      let dataHelper = DataHelper()
      
      dataHelper.storeTask(task: Task(title: "UI Test Bir", date: Date()))
      dataHelper.storeTask(task: Task(title: "UI Test İki ", date: Calendar.current.date(byAdding: .hour, value: 1, to: Date()) ?? Date()))
    }
  }
}
