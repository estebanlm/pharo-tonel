"
I know how to find accesses to an instance var
"
Class {
	#name : #SugsAccessesToInstVar,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAccessesToInstVar>>execute [
	^SystemNavigation default browseAllAccessesTo: context selectedVariableName from: context selectedClass
]

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAccessesToInstVar>>isValidForContext [
	^ context hasClassUnImplementedAccessors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsAccessesToInstVar>>label [
	^'Accesses to...' translated
]
