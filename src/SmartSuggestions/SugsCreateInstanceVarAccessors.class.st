"
I know how to create accessors for an instance var
"
Class {
	#name : #SugsCreateInstanceVarAccessors,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCreateInstanceVarAccessors>>execute [
	(NautilusRefactoring model: context) accessorsInstVarNamed: context selectedVariableName from: context selectedClass
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCreateInstanceVarAccessors>>isValidForContext [
	^ context hasUnImplementedAccessors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsCreateInstanceVarAccessors>>label [
	^ 'Create Accesors' translated
]
