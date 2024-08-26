//
//  MacroParkingLotXMLparser.swift
//  XMLParser+SwiftMacro
//
//  Created by Moon Jongseek on 8/6/24.
//

import Foundation

//final class MacroParkingLotXMLParserM: NSObject, XMLParserDelegate {
//    private var value: String?
//    private var itemList: [MacroParkingLot] = []
//    private var tempItem: MacroParkingLot?
//    
////    func parserDidStartDocument(_ parser: XMLParser) { }
//    
//    func parser(
//        _ parser: XMLParser,
//        didStartElement elementName: String,
//        namespaceURI: String?,
//        qualifiedName qName: String?,
//        attributes attributeDict: [String : String] = [:]
//    ) {
//        if elementName == "item" {
//            self.tempItem = MacroParkingLot()
//        }
//        self.value = elementName
//    }
//    
//    func parser(
//        _ parser: XMLParser,
//        didEndElement elementName: String,
//        namespaceURI: String?,
//        qualifiedName qName: String?) {
//            if elementName == "item" {
//                if let tempItem {
//                    self.itemList.append(tempItem)
//                }
//                self.tempItem = nil
//            }
//    }
//    
//    func parser(_ parser: XMLParser, foundCharacters string: String) {
//        if string.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty { return }
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
//    }
//    
//    func parserDidEndDocument(_ parser: XMLParser) {
//        itemList.forEach {
//            print($0)
//        }
//    }
//    
//    public func getPackingLotDataList() -> [MacroParkingLot] {
//        return self.itemList
//    }
//}
