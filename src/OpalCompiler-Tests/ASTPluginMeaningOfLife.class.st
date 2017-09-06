"
A simple example for a AST transforming compiler plugin.

I replace 42 with a  'meaning of life'.
"
Class {
	#name : #ASTPluginMeaningOfLife,
	#superclass : #OCCompilerASTPlugin,
	#category : #OpalCompiler-Tests-Plugins,
	#timestamp : 'MarcusDenker 2/28/2015 15:54'
}

{
	#category : #transformation,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTPluginMeaningOfLife>>transform [
	| rule |
	rule := RBParseTreeRewriter replaceLiteral: 42 with: 'meaning of life'.
	rule executeTree: ast.
	^ast
]
