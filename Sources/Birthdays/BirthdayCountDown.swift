//  Created by dasdom on 12.04.20.
//  Copyright © 2020 dasdom. All rights reserved.
//

import Foundation

public struct BirthdayCountdown : Hashable {
  public let name: String
  public let remainingDays: Int
  public let birthday: Birthday
  
  public init(birthday: Birthday) {
    
    // https://stackoverflow.com/a/31132581/498796
    let calendar = Calendar(identifier: .gregorian)
    let today = calendar.startOfDay(for: Date())
    let birthdayComponents = calendar.dateComponents([.day, .month], from: birthday.date)
    let nextBirthday = calendar.nextDate(after: today, matching: birthdayComponents, matchingPolicy: .nextTimePreservingSmallerComponents)
    
    guard let daysCount = calendar.dateComponents([.day], from: today, to: nextBirthday!).day else {
      fatalError()
    }
    
    name = birthday.name
    remainingDays = daysCount
    self.birthday = birthday
  }
}
