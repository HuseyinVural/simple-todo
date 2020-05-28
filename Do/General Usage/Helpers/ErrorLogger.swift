//
//  ErrorLogger.swift
//  Do
//
//  Created by Hüseyin Vural on 27.05.2020.
//  Copyright © 2020 Hüseyin Vural. All rights reserved.
//

import Foundation

class ErrorLogger: ErrorLoggable {
  let logHandler: LogHandlable
  init(logHandler: LogHandlable) {
    self.logHandler = logHandler
  }

  func log(_ message: String, with additionalInfo: [String: String]) {
    logHandler.storeLog(message, additionalInfo: additionalInfo)
  }
  
  func log(_ error: Error, with additionalInfo: [String: String]) {
    logHandler.storeLog(error, additionalInfo: additionalInfo)
  }
}

struct LogHandler: LogHandlable {
  func storeLog(_ error: Error, additionalInfo: [String: String]) {
    var modifiedInfo = additionalInfo
    modifiedInfo["Error Description"] = "Logger"
    debugPrint("Error: \(error), info: \(additionalInfo)")
  }
}
