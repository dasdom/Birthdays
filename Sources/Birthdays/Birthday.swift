//  Created by dasdom on 12.04.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import Foundation

public struct Birthday : Codable, Equatable, Hashable {
  let name: String
  public let date: Date
  public let oneTime: Bool
  
  public init(name: String, date: Date, oneTime: Bool = false) {
    self.name = name
    
    var dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: date)
    dateComponents.hour = 0
    dateComponents.minute = 0
    dateComponents.second = 0

    self.date = Calendar.current.date(from: dateComponents) ?? date
    self.oneTime = oneTime
  }
  
  public func id() -> String {
    return "\(name)-\(date.timeIntervalSince1970)"
  }
}

