//  Created by dasdom on 12.04.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import Foundation

public struct Birthday : Codable {
  let name: String
  let date: Date
  
  public init(name: String, date: Date) {
    self.name = name
    self.date = date
  }
}
