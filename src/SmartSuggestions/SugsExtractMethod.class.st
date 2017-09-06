"
If you want to extract code in a new method I'm your guy
"
Class {
	#name : #SugsExtractMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsExtractMethod>>execute [
	(NautilusRefactoring model: context) extractToMethodTextSelection
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsExtractMethod>>isValidForContext [
	^ context hasMoreSentences
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsExtractMethod>>label [
	^'Extract method' translated
]
