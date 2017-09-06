"
I know how to talk with a syntax error debugger and extract the information needed by the suggestions
"
Class {
	#name : #SugsSyntaxErrorDebuggerContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'GuillermoPolito 2/11/2016 12:07'
}

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSyntaxErrorDebuggerContext>>selectedClass [
	^model selectedClass
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSyntaxErrorDebuggerContext>>selectedMethod [

	^ nil
	
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsSyntaxErrorDebuggerContext>>sourceTextArea [
	^ model dependents first findDeepSubmorphThat: [ :m | m isKindOf: RubScrolledTextMorph ] ifAbsent: [ self error: 'should not happen' ]
]
