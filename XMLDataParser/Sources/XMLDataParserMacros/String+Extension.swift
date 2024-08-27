//
//  String+Extension.swift
//
//
//  Created by Moon Jongseek on 8/27/24.
//

import Foundation

extension String {
    func trimming() -> Self {
        var trimmingCharacterSet: CharacterSet = .whitespacesAndNewlines
        trimmingCharacterSet.insert("\"")
        
        return self.trimmingCharacters(in: trimmingCharacterSet)
    }
}
