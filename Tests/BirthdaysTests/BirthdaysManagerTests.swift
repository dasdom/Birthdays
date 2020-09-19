//  Created by dasdom on 19.09.20.
//  
//

import XCTest
@testable import Birthdays

final class BirthdaysManagerTests: XCTestCase {
  
  var sut: BirthdaysManager!
  
  override func setUpWithError() throws {
    sut = BirthdaysManager()
  }
  
  func test_oneTimeEvent_isRemovedWhenFinished() {
    let birthday = Birthday(name: "Foo", date: Date(timeIntervalSinceNow: -60 * 60 * 24), oneTime: true)
    sut.add(birthday)
    
    XCTAssertEqual(sut.birthdayCountdowns.count, 0)
  }
}
