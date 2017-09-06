"
I know how to inline the method from a message
"
Class {
	#name : #SugsInline,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsInline>>execute [
	 (NautilusRefactoring model: context) inlineMethodBetween: context selectedInterval from: context selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsInline>>label [
	 ^'Inline method' translated
]
