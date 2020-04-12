//  Created by dasdom on 12.04.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import Foundation

public struct BirthdayCount {
  public let name: String
  public let remainingDays: Int
  
  public init(birthday: Birthday) {
    
    let today = Date()
    let birthdayComponents = Calendar.current.dateComponents([.day, .month, .year], from: birthday.date)
    let currentDateComponents = Calendar.current.dateComponents([.day, .month, .year], from: today)
    
    guard let birthdayDay = birthdayComponents.day, let birthdayMonth = birthdayComponents.month,
      let currentDay = currentDateComponents.day, let currentMonth = currentDateComponents.month,
      let currentYear = currentDateComponents.year else {
        fatalError()
    }
    let transformedYear: Int?
    if birthdayMonth > currentMonth {
      transformedYear = currentYear
    } else if birthdayMonth == currentMonth, birthdayDay >= currentDay {
      transformedYear = currentYear
    } else {
      transformedYear = currentYear + 1
    }

    var dateComponents = DateComponents()
    dateComponents.day = birthdayDay
    dateComponents.month = birthdayMonth
    dateComponents.year = transformedYear
    guard let date = Calendar.current.date(from: dateComponents) else {
      fatalError()
    }
    
    guard let daysCount = Calendar.current.dateComponents([.day], from: today, to: date).day else {
      fatalError()
    }
    
    name = birthday.name
    remainingDays = daysCount
  }
}
