"
I know how to pull up the method to my superclass
"
Class {
	#name : #SugsPullUpMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsPullUpMethod>>execute [
	(NautilusRefactoring model: context) pullUpMethodsFor: (OrderedCollection with: context selectedMethod)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsPullUpMethod>>label [
	^ 'Pull Up' translated
]
