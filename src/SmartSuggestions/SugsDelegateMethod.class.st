"
I know how to delegate the selected method in an instance variable and move the code to a class
"
Class {
	#name : #SugsDelegateMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDelegateMethod>>execute [
	 (NautilusRefactoring model: context) moveMethodFor: context selectedMethod
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDelegateMethod>>isValidForContext [
	^ context hasInstanceVariable
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsDelegateMethod>>label [
	^'Delegate selected method' translated
]
