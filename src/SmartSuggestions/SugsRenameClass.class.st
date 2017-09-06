"
I know how to rename a class
"
Class {
	#name : #SugsRenameClass,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameClass>>execute [
	(NautilusRefactoring model: context) renameClass: context bindedSelectedClass.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameClass>>label [
	^'Rename class' translated
]
