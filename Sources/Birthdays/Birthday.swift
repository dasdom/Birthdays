//  Created by dasdom on 12.04.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import Foundation

public struct Birthday : Codable, Equatable, Hashable {
  let name: String
  public let date: Date
  let oneTime: Bool
  
  public init(name: String, date: Date, oneTime: Bool = false) {
    self.name = name
    self.date = date
    self.oneTime = oneTime
  }
}

