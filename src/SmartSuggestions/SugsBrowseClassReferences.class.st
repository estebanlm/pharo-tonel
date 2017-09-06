"
I know how to browse references from a class
"
Class {
	#name : #SugsBrowseClassReferences,
	#superclass : #SugsSuggestion,
	#category : #SmartSuggestions-Suggestion,
	#timestamp : '<historical>'
}

{
	#category : #execution,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBrowseClassReferences>>execute [
	SystemNavigation default browseAllCallsOnClass: context bindedSelectedClass.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsBrowseClassReferences>>label [
	^ 'Browse references' translated

]
