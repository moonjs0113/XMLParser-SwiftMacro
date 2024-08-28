//
//  ParkingLotXMLParser.swift
//  XMLParser+SwiftMacro
//
//  Created by Moon Jongseek on 8/6/24.
//

import Foundation

final class ParkingLotXMLParser: NSObject, XMLParserDelegate {
    private var tagName: String?
    private var itemList: [ParkingLot] = []
    private var data: ParkingLot?
    
    func parser(
        _ parser: XMLParser,
        didStartElement elementName: String,
        namespaceURI: String?,
        qualifiedName qName: String?,
        attributes attributeDict: [String : String] = [:]
    ) {
        if elementName == "item" {
            self.data = ParkingLot()
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
        if tagName == "airportEng" {
            data?.airportEng = string
        } else if tagName == "airportKor" {
            data?.airportKor = string
        } else if tagName == "parkingAirportCodeName" {
            data?.parkingAirportCodeName = string
        } else if tagName == "parkingCongestion" {
            data?.parkingCongestion = string
        } else if tagName == "parkingCongestionDegree" {
            data?.parkingCongestionDegree = string
        } else if tagName == "parkingOccupiedSpace" {
            data?.parkingOccupiedSpace = string
        } else if tagName == "parkingTotalSpace" {
            data?.parkingTotalSpace = string
        } else if tagName == "sysGetdate" {
            data?.sysGetdate = string
        } else if tagName == "sysGettime" {
            data?.sysGettime = string
        }
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        itemList.forEach {
            print($0)
        }
    }
    
    public func getPackingLotDataList() -> [ParkingLot] {
        return self.itemList
    }
}
