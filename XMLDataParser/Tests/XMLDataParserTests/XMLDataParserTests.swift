import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(XMLDataParserMacros)
import XMLDataParserMacros

let testMacros: [String: Macro.Type] = [
    "stringify": StringifyMacro.self,
    "XMLPropertyParser": XMLParserMacro.self,
    "XMLPropertyList": XMLDataMacro.self,
]
#endif

final class XMLDataParserTests: XCTestCase {
    func testXMLMember() throws {
#if canImport(XMLDataParserMacros)
        assertMacroExpansion(
    """
    @XMLPropertyList(tagNames: ["airportEng", "airportKor"])
    class MacroParkingLot: NSObject {
    
    }
    """,
    expandedSource: """
    class MacroParkingLot: NSObject {
    
        var airportEng: String?
    
        var airportKor: String?
    
    }
    """,
    macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
    
    func testXMLParser() throws {
#if canImport(XMLDataParserMacros)
        assertMacroExpansion(
    """
    #XMLPropertyParser("tagName", "data", "value", propertyNames: ["name"])
    """,
    expandedSource: """
    if tagName == "name" {
        data?.name = value
    }
    """,
    macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
    
    func testXMLParserMoreThanTwoProperty() throws {
#if canImport(XMLDataParserMacros)
        assertMacroExpansion(
    """
    #XMLPropertyParser("tagName", "data", "value", propertyNames: ["name", "age"])
    """,
    expandedSource: """
    if tagName == "name" {
        data?.name = value
    } else if tagName == "age" {
        data?.age = value
    }
    """,
    macros: testMacros
        )
#else
        throw XCTSkip("macros are only supported when running tests for the host platform")
#endif
    }
    
    func testMacro() throws {
        #if canImport(XMLDataParserMacros)
        assertMacroExpansion(
            """
            #stringify(a + b)
            """,
            expandedSource: """
            (a + b, "a + b")
            """,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }

    func testMacroWithStringLiteral() throws {
        #if canImport(XMLDataParserMacros)
        assertMacroExpansion(
            #"""
            #stringify("Hello, \(name)")
            """#,
            expandedSource: #"""
            ("Hello, \(name)", #""Hello, \(name)""#)
            """#,
            macros: testMacros
        )
        #else
        throw XCTSkip("macros are only supported when running tests for the host platform")
        #endif
    }
}
