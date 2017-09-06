"
I know how to format the code
"
Class {
	#name : #SugsFormatCode,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFormatCode>>execute [
	context formatSourceCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFormatCode>>label [
	^'Format method' translated
]
