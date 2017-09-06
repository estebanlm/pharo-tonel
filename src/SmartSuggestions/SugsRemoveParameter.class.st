"
I know how to remove a parameter from a method
"
Class {
	#name : #SugsRemoveParameter,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRemoveParameter>>execute [
	(NautilusRefactoring model: context) removeParameterFor: context selectedMethod 
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRemoveParameter>>isValidForContext [
	^ context hasParameters
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRemoveParameter>>label [
	^'Remove parameter' translated
]
