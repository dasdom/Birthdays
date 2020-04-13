//  Created by dasdom on 13.04.20.
//  
//

import Foundation

extension FileManager {
  
  private func documentsURL() -> URL {
    self.urls(for: .documentDirectory, in: .userDomainMask).first!
  }
  
  func birthdaysURL() -> URL {
    documentsURL().appendingPathComponent("birthdays.json")
  }
}
