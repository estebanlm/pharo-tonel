"

"
Class {
	#name : #TextLineTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #'Morphic-Tests-Text Support',
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
TextLineTest>>setUp [
	super setUp.
	prototypes
		add: (TextLine
				start: 1
				stop: 50
				internalSpaces: 2
				paddingWidth: 1) 
]
