"
I know how to remove a mehod
"
Class {
	#name : #SugsRemoveMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRemoveMethod>>execute [
	(NautilusRefactoring model: context) removeMethodsFor: (OrderedCollection with: context selectedMethod)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRemoveMethod>>label [
	^'Remove method' translated
]
