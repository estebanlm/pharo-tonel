"
I know how to use a ProcessBrowser to extract the information needed for the suggestions
"
Class {
	#name : #SugsProcessBrowserContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'DenisKudryashov 2/24/2016 10:27'
}

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsProcessBrowserContext>>selectedClass [
	^ model selectedClass
]

{
	#category : #selection,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsProcessBrowserContext>>selectedMethod [
	^ model selectedMethod
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsProcessBrowserContext>>sourceTextArea [
	| window |
	window := model dependents ifEmpty: [ nil ] ifNotEmpty: [ model dependents at: 1  ].
	
	^window submorphThat: [:each | each respondsTo: #selectionInterval] ifNone: [nil]
]
