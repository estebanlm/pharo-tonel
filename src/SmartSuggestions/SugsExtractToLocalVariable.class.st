"
The classic option to extract a line of code in a local variable
"
Class {
	#name : #SugsExtractToLocalVariable,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsExtractToLocalVariable>>execute [
	(NautilusRefactoring model: context) extractToTempTextSelection
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsExtractToLocalVariable>>isValidForContext [
	^context hasOneStatement.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsExtractToLocalVariable>>label [
	^ 'Extract local' translated
]
