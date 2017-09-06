"
I know how to talk with a debugger and extract the information needed for the suggestions :)
"
Class {
	#name : #SugsDebuggerContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : '<historical>'
}

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDebuggerContext>>selectedClass [
	^model selectedClass
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDebuggerContext>>selectedMethod [

	^model selectedContext method
	
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDebuggerContext>>sourceTextArea [
	^ model dependents at: 3 
]
