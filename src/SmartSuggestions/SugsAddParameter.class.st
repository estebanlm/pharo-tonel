"
I know how to add a parameter to a method
"
Class {
	#name : #SugsAddParameter,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAddParameter>>execute [
	(NautilusRefactoring model: context) addAParameterFor: context selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAddParameter>>label [
	^'Add a parameter' translated
]
