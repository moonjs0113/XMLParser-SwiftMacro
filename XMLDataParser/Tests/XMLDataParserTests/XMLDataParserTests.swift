import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest

// Macro implementations build for the host, so the corresponding module is not available when cross-compiling. Cross-compiled tests may still make use of the macro itself in end-to-end tests.
#if canImport(XMLDataParserMacros)
import XMLDataParserMacros

let testMacros: [String: Macro.Type] = [
    "stringify": StringifyMacro.self,
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
    #XMLPropertyParser("value","tempItem")
    """,
    expandedSource: """
    var raw: String?
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
