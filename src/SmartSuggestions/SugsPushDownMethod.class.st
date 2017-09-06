"
I know how to push down the method to my subclass
"
Class {
	#name : #SugsPushDownMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsPushDownMethod>>execute [
	(NautilusRefactoring model: context) pushDownMethodsFor: (OrderedCollection with: context selectedMethod)
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsPushDownMethod>>isValidForContext [
	^  context hasSubclasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsPushDownMethod>>label [
	^'Push Down' translated
]
