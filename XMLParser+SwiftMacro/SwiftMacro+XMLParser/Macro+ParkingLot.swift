//
//  MacroParkingLot.swift
//  XMLParser+SwiftMacro
//
//  Created by Moon Jongseek on 8/6/24.
//

import Foundation
import XMLDataParser

@XMLPropertyList(tagNames: [
"airportEng",
"airportKor",
"parkingAirportCodeName",
"parkingCongestion",
"parkingCongestionDegree",
"parkingOccupiedSpace",
"parkingTotalSpace",
"sysGetdate",
"sysGettime"
])
struct MacroParkingLot {
    
}
