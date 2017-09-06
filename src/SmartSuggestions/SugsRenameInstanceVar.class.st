"
I know how to rename an instance variable
"
Class {
	#name : #SugsRenameInstanceVar,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameInstanceVar>>execute [
	(NautilusRefactoring model: context) renameInstVarNamed: context selectedVariableName from: context selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameInstanceVar>>label [
	^'Rename' translated
]
