"
Superclass for SUnit tests for smart suggestions
"
Class {
	#name : #SugsSuggestionTest,
	#superclass : #TestCase,
	#instVars : [
		'emptyClass'
	],
	#category : #SmartSuggestions-Tests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:42'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>addMethodToDelegate [
	self emptyClass compile: 'methodToDelegate<n><t>2+5. <n><t>OrderedCollection new.' expandMacros classified: #testing
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>addVariable: name to: aClass [
	name first isUppercase ifTrue: [ aClass addClassVarNamed: name] ifFalse: [aClass addInstVarNamed: name].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>createAccessorsFor: varName in: aClass [

	self createGetter: varName in: aClass.	
	self createSetter: varName in: aClass .
	
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>createClass: symbol [
	| newClass |
	
	newClass := Object 
					subclass: symbol
					instanceVariableNames: ''
					classVariableNames: ''
					poolDictionaries: ''
					category: 'SmartSuggestions-Test'.
	^newClass.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>createContext: selectedVariableName [
	^ SugsMockContext for: self emptyClass selectedVariable: selectedVariableName 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>createGetter: varName in: aClass [
	| target name |

	target := self targetFor: varName in: aClass.
	name := self nameFor: varName.	
	target
		compile: ('<1s><n><t>^ <2s>' expandMacrosWith: name with: varName)
		classified: #accessing.
	
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>createSetter: varName in: aClass  [
	| target name |
	
	target := self targetFor: varName in: aClass.
	name := self nameFor: varName.	
	target
		compile: ('<1s> anObject<n><t><2s> := anObject' expandMacrosWith: (name,':') with: varName)
		classified: #accessing.
	
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>emptyClass [
	^ emptyClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>nameFor: varName [
	| name |
	
	name:= varName copy.
	name at: 1 put: name first asLowercase.
	^name.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>removeClass: aClass [
	aClass removeFromSystem.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>setUp [
	super setUp.
	emptyClass  := self createClass: #TestWithAccessors.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:46'
}
SugsSuggestionTest>>tearDown [
	super tearDown.
	self removeClass: emptyClass .
]
