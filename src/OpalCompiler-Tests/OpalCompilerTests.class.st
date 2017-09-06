"

"
Class {
	#name : #OpalCompilerTests,
	#superclass : #TestCase,
	#category : #OpalCompiler-Tests-Misc,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OpalCompilerTests>>testBindingsWithUppercaseNameDoNotOverwriteGlobals [
	| result |
	result := Smalltalk compiler
		bindings: { #UndefinedObject -> Object } asDictionary;
		evaluate: 'UndefinedObject class'.
		
	self assert: result = UndefinedObject class.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OpalCompilerTests>>testEvaluateWithBindings [
	| result |
	result := Smalltalk compiler
		bindings: { #a -> 3 } asDictionary;
		evaluate: '1+a'.
		
	self assert: result = 4.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
OpalCompilerTests>>testEvaluateWithBindingsWithUppercaseName [
	| result |
	result := Smalltalk compiler
		bindings: { #MyVar -> 3 } asDictionary;
		evaluate: '1+MyVar'.
		
	self assert: result = 4.
]
