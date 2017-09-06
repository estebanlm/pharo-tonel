"
This inline a variable in an assignment sentence
"
Class {
	#name : #SugsInlineTemporary,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsInlineTemporary>>execute [
	 (NautilusRefactoring model: context) inlineTemporaryBetween: context selectedInterval from: context selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsInlineTemporary>>label [
	 ^'Inline temporary' translated
]
