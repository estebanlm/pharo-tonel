"
I know how to create accessors for a class var
"
Class {
	#name : #SugsCreateClassVarAccessors,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCreateClassVarAccessors>>execute [
	(NautilusRefactoring model: context) accessorsClassVarNamed: context selectedVariableName from: context selectedClass
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCreateClassVarAccessors>>isValidForContext [
	^context hasClassUnImplementedAccessors 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCreateClassVarAccessors>>label [
	^'Create accessors' translated
]
