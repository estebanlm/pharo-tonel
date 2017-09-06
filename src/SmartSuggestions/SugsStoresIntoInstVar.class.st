"
I know how to find stores into for an instance var
"
Class {
	#name : #SugsStoresIntoInstVar,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsStoresIntoInstVar>>execute [
	 SystemNavigation default browseAllStoresInto: context selectedVariableName from: context selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsStoresIntoInstVar>>label [
	^'Stores Into...' translated
]
