"
I know how to use a Transcript to extract the information needed for the suggestions
"
Class {
	#name : #SugsTranscriptContext,
	#superclass : #SugsAbstractContext,
	#category : #SmartSuggestions-Menu,
	#timestamp : 'DenisKudryashov 2/24/2016 13:28'
}

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsTranscriptContext>>selectedClass [
	^nil
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsTranscriptContext>>selectedMethod [

	^nil
]

{
	#category : #refactoring,
	#timestamp : ' 8/31/2017 05:26:39'
}
SugsTranscriptContext>>sourceTextArea [
	| window |
	window := model dependents ifEmpty: [ nil ] ifNotEmpty: [ model dependents at: 1  ].
	
	^window submorphThat: [ :each | each respondsTo: #selectionInterval ] ifNone: [ nil ]
]
