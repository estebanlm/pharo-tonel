"

"
Class {
	#name : #ASTTransformationPluginTest,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-Plugins,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTTransformationPluginTest>>testClassWithPluginEnabled [
	self assert: ASTTransformExamplePluginActive new example42 = 'meaning of life'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTTransformationPluginTest>>testTransform [
		| ast |
		ast := (OCOpalExamples>>#exampleReturn42) ast copy.
		self assert: ast body statements first value value =  42.
		ast := ASTPluginMeaningOfLife transform: ast.
		self assert: ast body statements first value value =  'meaning of life'.
]
