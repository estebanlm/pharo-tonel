"
I know how to rename a class variable
"
Class {
	#name : #SugsRenameClassVar,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameClassVar>>execute [
	(NautilusRefactoring model: context) renameClassVarNamed: context selectedVariableName from: context selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsRenameClassVar>>label [
	^ 'Rename' translated
]
