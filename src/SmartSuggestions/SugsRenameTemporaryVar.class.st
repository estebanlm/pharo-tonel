"
I know how to rename a local variable.
"
Class {
	#name : #SugsRenameTemporaryVar,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameTemporaryVar>>execute [
	(NautilusRefactoring model: context)
				renameTemporaryNamed: context selectedVariableName
				Between: (context nodeStart to: context nodeStop)
				from: context selectedMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameTemporaryVar>>label [
	^  'Rename' translated
]
