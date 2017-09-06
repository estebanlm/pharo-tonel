"

"
Class {
	#name : #GLMHighlighterTextParserStyler,
	#superclass : #SHTextStyler,
	#instVars : [
		'parser'
	],
	#category : #Glamour-Rubric-Presentations,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextParserStyler>>parser [
	
	^ parser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextParserStyler>>parser: anObject [
	
	parser := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextParserStyler>>privateFormat: aText  [
	self flag: 'This feature is not supported for now.'.
	^ aText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMHighlighterTextParserStyler>>privateStyle: aText  [
	| styledText |
	aText makeAllColor: Color red.
	styledText := self parser parse: aText asString onError: [  ].
	(styledText notNil and: [ styledText ~~ aText ]) ifTrue: [ 
		self flag: 'change only the runs array of the original text.'.
		aText setString: aText string setRunsChecking: styledText runs ]
]
