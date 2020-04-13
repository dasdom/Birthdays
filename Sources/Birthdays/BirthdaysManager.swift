//  Created by dasdom on 13.04.20.
//  
//

import Foundation

public class BirthdaysManager {
  public private(set) var all: [Birthday] {
    didSet {
      birthdayCounts = all
        .map { BirthdayCount(birthday: $0) }
        .sorted(by: { $0.remainingDays < $1.remainingDays })
    }
  }
  public private(set) var birthdayCounts: [BirthdayCount]
  public var count: Int {
    birthdayCounts.count
  }
  
  public init() {
    all = []
    birthdayCounts = []
    
    all = loadBirthdays()
    
    birthdayCounts = all
      .map { BirthdayCount(birthday: $0) }
      .sorted(by: { $0.remainingDays < $1.remainingDays })
  }
  
  public func add(_ birthday: Birthday) {
    all.append(birthday)
    save(birthdays: all)
  }
  
  public func birthdayCount(for index: Int) -> BirthdayCount {
    birthdayCounts[index]
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
