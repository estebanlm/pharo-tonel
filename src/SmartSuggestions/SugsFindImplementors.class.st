"
I know how to find implementors for a message
"
Class {
	#name : #SugsFindImplementors,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFindImplementors>>execute [
	SystemNavigation default browseAllImplementorsOf: context selectedMessageName
				
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsFindImplementors>>label [
	^  'Implementors' translated
]
