"
I know how to replace the call of a class variable for the use of an accessor and create accessors if it's necessary.
"
Class {
	#name : #SugsUseAccessorsForClassVar,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsUseAccessorsForClassVar>>execute [
	(NautilusRefactoring model: context) abstractClassVarFrom: context selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsUseAccessorsForClassVar>>label [
	^'Use accessor' translated
]
