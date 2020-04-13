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

public extension Birthday {
  public static func save(birthdays: [Birthday]) {
    do {
      let data = try JSONEncoder().encode(birthdays)
      data.write(to: FileManager.default.birthdaysURL(), options: .atomic)
    } catch {
      print("error: \(error)")
    }
  }
  
  public static func loadBirthdays() -> [Birthdays] {
    do {
      let data = Data(contentsOf: FileManager.default.birthdaysURL())
      return JSONDecoder().decode([Birthday].self, from: data)
    } catch {
      return []
    }
  }
}

