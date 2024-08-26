import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import Foundation

/// Implementation of the `stringify` macro, which takes an expression
/// of any type and produces a tuple containing the value of that expression
/// and the source code that produced the value. For example
///
///     #stringify(x + y)
///
///  will expand to
///
///     (x + y, "x + y")
public struct StringifyMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }

        return "(\(argument), \(literal: argument.description))"
    }
}

public struct XMLDataMacro: MemberMacro {
    public static func expansion(
        of node: AttributeSyntax,
        providingMembersOf declaration: some DeclGroupSyntax,
        in context: some MacroExpansionContext
    ) throws -> [DeclSyntax] {
        guard declaration.is(StructDeclSyntax.self) else {
            let structError = Diagnostic(
                node: node,
                message: XMLDataDiagnostic.notAStruct
            )
            context.diagnose(structError)
            return []
        }
        
        guard let labeledExprListSyntax = node.arguments?.as(LabeledExprListSyntax.self) as? LabeledExprListSyntax else {
            return []
        }
        guard let arrayExprSyntax = labeledExprListSyntax.first?.expression.as(ArrayExprSyntax.self) as? ArrayExprSyntax else {
            return []
        }
        
        var trimmingCharacterSet: CharacterSet = .whitespacesAndNewlines
        trimmingCharacterSet.insert("\"")
        
        return arrayExprSyntax.elements.map {
            "\($0.expression)".trimmingCharacters(in: trimmingCharacterSet)
        }.map {
            "var \(raw: $0): String?"
        }
    }
}

enum XMLDataDiagnostic: String, DiagnosticMessage {
    case notAStruct
    
    var message: String {
        switch self {
        case .notAStruct:
            return "'@XMLDataMacro' can only be applied to a 'struct'"
        }
    }
    
    var diagnosticID: MessageID {
        return MessageID(domain: "XMLDataParserMacro", id: rawValue)
    }
    
    var severity: DiagnosticSeverity {
        return .error
    }
    
    
}

@main
struct XMLDataParserPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        XMLDataMacro.self,
        StringifyMacro.self,
    ]
}
