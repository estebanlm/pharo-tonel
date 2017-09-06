"
I am an abstract Athens renderer. 
"
Class {
	#name : #OSWindowAthensRenderer,
	#superclass : #OSWindowRenderer,
	#instVars : [
		'athensSurface',
		'session'
	],
	#category : #OSWindow-Core,
	#timestamp : 'Matthieu 5/28/2015 11:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>athensSurface [
	^ athensSurface
]

{
	#category : #'session management',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>checkSession [
	session == Smalltalk session 
		ifFalse: [ self error: 'Cannot use this renderer (created in a previous session or in a closed window)' ].
]

{
	#category : #deleting,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>destroy [
	
	super destroy.
	athensSurface := nil.
	session := nil.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>drawDuring: aBlock [
	self prepareForDrawing.
	self athensSurface drawDuring: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>initialize [
	super initialize.
	session := Smalltalk session.
	athensSurface := nil.
]

{
	#category : #drawing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>prepareForDrawing [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindowAthensRenderer>>surface [
	^ self athensSurface
]
