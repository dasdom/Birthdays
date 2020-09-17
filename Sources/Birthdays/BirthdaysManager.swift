//  Created by dasdom on 13.04.20.
//  
//

import Foundation

public class BirthdaysManager : ObservableObject {
  
  let fileURL: URL
  public var all: [Birthday] {
    didSet {
      birthdayCountdowns = all
        .filter({ birthday -> Bool in
          return birthday.date.timeIntervalSince(Date()) > 0 || birthday.periodically
        })
        .map { BirthdayCountdown(birthday: $0) }
        .sorted(by: { $0.remainingDays < $1.remainingDays })
    }
  }
  @Published public private(set) var birthdayCountdowns: [BirthdayCountdown]
  
  public init(fileURL: URL? = nil) {
    if let fileURL = fileURL {
      self.fileURL = fileURL
    } else {
      self.fileURL = FileManager.default.birthdaysURL()
    }
    all = []
    birthdayCountdowns = []
    
    all = loadBirthdays()
    
    birthdayCountdowns = all
      .map { BirthdayCountdown(birthday: $0) }
      .sorted(by: { $0.remainingDays < $1.remainingDays })
  }
  
  public func add(_ birthday: Birthday) {
    all.append(birthday)
    save(birthdays: all)
  }
  
  public func remove(at index: Int) {
    if index < birthdayCountdowns.count {
      let birthday = birthdayCountdowns[index].birthday
      if let allIndex = all.firstIndex(of: birthday) {
        all.remove(at: allIndex)
        save(birthdays: all)
      }
    }
  }
}

public extension BirthdaysManager {
  func save(birthdays: [Birthday]) {
    do {
      let data = try JSONEncoder().encode(birthdays)
      try data.write(to: fileURL, options: .atomic)
    } catch {
      print("error: \(error)")
    }
  }
  
  func loadBirthdays() -> [Birthday] {
    do {
      let data = try Data(contentsOf: fileURL)
      return try JSONDecoder().decode([Birthday].self, from: data)
    } catch {
      return []
    }
  }
}
