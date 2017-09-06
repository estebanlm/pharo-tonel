"

"
Class {
	#name : #RBNullFormatterTest,
	#superclass : #TestCase,
	#category : #AST-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBNullFormatterTest>>testGivenAMethodNodeWhenSourceAvailableThenSourceReturnedAsResultOfFormatting [
	| ast sourceCode |
	sourceCode := (Collection class>>#with:with:) sourceCode.
	ast := RBParser parseMethod: sourceCode.
	self 
		assert: (RBNullFormatter new format: ast)
		equals: sourceCode
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBNullFormatterTest>>testGivenAMethodNodeWhenSourceNotAvailableThenSelectorWithWarningMessageReturnedAsResultOfFormatting [
	| ast sourceCode |
	sourceCode := (Collection class>>#with:with:) sourceCode.
	ast := RBParser parseMethod: sourceCode.
	ast source: nil.
	self 
		assert: (RBNullFormatter new format: ast)
		equals: 'with:with:
	''no source and no formatter available!'''
]
