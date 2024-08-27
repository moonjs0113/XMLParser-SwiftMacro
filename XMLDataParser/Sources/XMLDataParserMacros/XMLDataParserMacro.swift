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
//        guard declaration.is(ClassDeclSyntax.self) else {
//            let structError = Diagnostic(
//                node: node,
//                message: XMLDataDiagnostic.notAClass
//            )
//            context.diagnose(structError)
//            return []
//        }
        
        guard let classDeclaration = declaration.as(ClassDeclSyntax.self) else {
            let structError = Diagnostic(
                node: node,
                message: XMLDataDiagnostic.notAClass
            )
            context.diagnose(structError)
            return []
        }
        
        guard let inheritanceClause = classDeclaration.inheritanceClause else {
            let structError = Diagnostic(
                node: node,
                message: XMLDataDiagnostic.notNSObject
            )
            context.diagnose(structError)
            return []
        }
        
        let inheritedTypes = inheritanceClause.inheritedTypes.compactMap { $0.type.as(IdentifierTypeSyntax.self)?.name.text }
        if !inheritedTypes.contains("NSObject") {
            let structError = Diagnostic(
                node: node,
                message: XMLDataDiagnostic.notNSObject
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
    case notAClass
    case notNSObject
    
    var message: String {
        switch self {
        case .notAClass:
            return "'@XMLDataMacro' can only be applied to a 'class'"
        case .notNSObject:
            return "'@XMLDataMacro' can only be applied to a class adopted 'NSObject' protocol"
        }
    }
    
    var diagnosticID: MessageID {
        return MessageID(domain: "XMLDataParserMacro", id: rawValue)
    }
    
    var severity: DiagnosticSeverity {
        return .error
    }
}

public struct XMLParserMacro: ExpressionMacro {
    public static func expansion(
        of node: some FreestandingMacroExpansionSyntax,
        in context: some MacroExpansionContext
    ) -> ExprSyntax {
        guard let argument = node.argumentList.first?.expression else {
            fatalError("compiler bug: the macro does not have any arguments")
        }
        print(node.argumentList)
        print(VariableDeclSyntax(
            bindingSpecifier: .keyword(.var),
            bindings: [
                PatternBindingSyntax(
                    pattern: IdentifierPatternSyntax(identifier: "name"),
                    typeAnnotation: TypeAnnotationSyntax(
                        colon: .colonToken(),
                        type: IdentifierTypeSyntax(name: .identifier("String?"))
                    )
                )
            ]
        ))
        
//        if value == "airportEng" {
//            tempItem?.airportEng = string
//        } else
        return "var raw: String?"
    }
}

@main
struct XMLDataParserPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        XMLDataMacro.self,
        XMLParserMacro.self,
        StringifyMacro.self,
    ]
}
