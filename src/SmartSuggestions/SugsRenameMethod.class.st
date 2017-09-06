"
I know how to rename methods
"
Class {
	#name : #SugsRenameMethod,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameMethod>>execute [
	 (NautilusRefactoring model: context) renameMethodFor: context selectedMethod 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameMethod>>label [
	^ 'Rename' translated
]
