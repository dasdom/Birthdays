//  Created by dasdom on 13.04.20.
//  
//

import Foundation

public class BirthdaysManager {
  public private(set) lazy var all: [Birthday] = {
    loadBirthdays()
  }()
  
  func add(_ birthday: Birthday) {
    all.append(birthday)
    save(birthdays: all)
  }
}

public extension BirthdaysManager {
  func save(birthdays: [Birthday]) {
    do {
      let data = try JSONEncoder().encode(birthdays)
      try data.write(to: FileManager.default.birthdaysURL(), options: .atomic)
    } catch {
      print("error: \(error)")
    }
  }
  
  func loadBirthdays() -> [Birthday] {
    do {
      let data = try Data(contentsOf: FileManager.default.birthdaysURL())
      return try JSONDecoder().decode([Birthday].self, from: data)
    } catch {
      return []
    }
  }
}
