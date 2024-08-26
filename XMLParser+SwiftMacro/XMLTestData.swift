//
//  XMLTestData.swift
//  XMLParser+SwiftMacro
//
//  Created by Moon Jongseek on 8/6/24.
//

import Foundation

let XML_TEST_DATA = """
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <airportEng>GIMPO INTERNATIONAL AIRPORT</airportEng>
                <airportKor>김포국제공항</airportKor>
                <parkingAirportCodeName>국내선 제1주차장</parkingAirportCodeName>
                <parkingCongestion>원활</parkingCongestion>
                <parkingCongestionDegree>83.06%</parkingCongestionDegree>
                <parkingOccupiedSpace>1893</parkingOccupiedSpace>
                <parkingTotalSpace>2279</parkingTotalSpace>
                <sysGetdate>2024-08-03</sysGetdate>
                <sysGettime>21:38:02</sysGettime>
            </item>
            <item>
                <airportEng>GIMPO INTERNATIONAL AIRPORT</airportEng>
                <airportKor>김포국제공항</airportKor>
                <parkingAirportCodeName>국내선 제2주차장</parkingAirportCodeName>
                <parkingCongestion>원활</parkingCongestion>
                <parkingCongestionDegree>74.84%</parkingCongestionDegree>
                <parkingOccupiedSpace>1297</parkingOccupiedSpace>
                <parkingTotalSpace>1733</parkingTotalSpace>
                <sysGetdate>2024-08-03</sysGetdate>
                <sysGettime>21:38:02</sysGettime>
            </item>
            <item>
                <airportEng>GIMPO INTERNATIONAL AIRPORT</airportEng>
                <airportKor>김포국제공항</airportKor>
                <parkingAirportCodeName>국제선 주차빌딩</parkingAirportCodeName>
                <parkingCongestion>혼잡</parkingCongestion>
                <parkingCongestionDegree>91.01%</parkingCongestionDegree>
                <parkingOccupiedSpace>516</parkingOccupiedSpace>
                <parkingTotalSpace>567</parkingTotalSpace>
                <sysGetdate>2024-08-03</sysGetdate>
                <sysGettime>21:38:02</sysGettime>
            </item>
            <item>
                <airportEng>GIMPO INTERNATIONAL AIRPORT</airportEng>
                <airportKor>김포국제공항</airportKor>
                <parkingAirportCodeName>국제선 지하</parkingAirportCodeName>
                <parkingCongestion>만차</parkingCongestion>
                <parkingCongestionDegree>96.5%</parkingCongestionDegree>
                <parkingOccupiedSpace>1158</parkingOccupiedSpace>
                <parkingTotalSpace>1200</parkingTotalSpace>
                <sysGetdate>2024-08-03</sysGetdate>
                <sysGettime>21:38:02</sysGettime>
            </item>
            <item>
                <airportEng>GIMPO INTERNATIONAL AIRPORT</airportEng>
                <airportKor>김포국제공항</airportKor>
                <parkingAirportCodeName>화물청사</parkingAirportCodeName>
                <parkingCongestion>원활</parkingCongestion>
                <parkingCongestionDegree>63.23%</parkingCongestionDegree>
                <parkingOccupiedSpace>466</parkingOccupiedSpace>
                <parkingTotalSpace>737</parkingTotalSpace>
                <sysGetdate>2024-08-03</sysGetdate>
                <sysGettime>21:38:02</sysGettime>
            </item>
        </items>
        <numOfRows>20</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>5</totalCount>
    </body>
</response>
"""

