//
//  ParkingLotXMLParser+Macro.swift
//  XMLParser+SwiftMacro
//
//  Created by Moon Jongseek on 8/27/24.
//

import Foundation
import XMLDataParser

final class MacroParkingLotXMLParser: NSObject, XMLParserDelegate {
    private var tagName: String?
    private var itemList: [MacroParkingLot] = []
    private var data: MacroParkingLot?
    
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]
    ) {
        if elementName == "item" {
            self.data = MacroParkingLot()
        }
        self.tagName = elementName
    }
    
    func parser(
        _ parser: XMLParser,
        didEndElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?) {
            if elementName == "item" {
                if let data {
                    self.itemList.append(data)
                }
                self.data = nil
            }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return }
//        let propertyList = Mirror(reflecting: MacroParkingLot()).children.compactMap { $0.label }
        #XMLPropertyParser("tagName", "data", "string", propertyNames: ["airportEng", "airportKor", "parkingAirportCodeName", "parkingCongestion", "parkingCongestionDegree", "parkingOccupiedSpace", "parkingTotalSpace", "sysGetdate", "sysGettime"])
//        if value == "airportEng" {
//            tempItem?.airportEng = string
//        } else if value == "airportKor" {
//            tempItem?.airportKor = string
//        } else if value == "parkingAirportCodeName" {
//            tempItem?.parkingAirportCodeName = string
//        } else if value == "parkingCongestion" {
//            tempItem?.parkingCongestion = string
//        } else if value == "parkingCongestionDegree" {
//            tempItem?.parkingCongestionDegree = string
//        } else if value == "parkingOccupiedSpace" {
//            tempItem?.parkingOccupiedSpace = string
//        } else if value == "parkingTotalSpace" {
//            tempItem?.parkingTotalSpace = string
//        } else if value == "sysGetdate" {
//            tempItem?.sysGetdate = string
//        } else if value == "sysGettime" {
//            tempItem?.sysGettime = string
//        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        itemList.forEach {
            print($0)
        }
    }
    
    public func getPackingLotDataList() -> [MacroParkingLot] {
        return self.itemList
    }
}

