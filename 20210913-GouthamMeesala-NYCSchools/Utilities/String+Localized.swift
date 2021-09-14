//
//  String+Localized.swift
//  20210913-GouthamMeesala-NYCSchools
//
//  Created by Goutham Meesala on 9/13/21.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
}
