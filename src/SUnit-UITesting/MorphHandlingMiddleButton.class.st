"
I log when the middle mouse button has been clicked on me, which is useful for testing.
"
Class {
	#name : #MorphHandlingMiddleButton,
	#superclass : #Morph,
	#instVars : [
		'menu',
		'receivedBlueButtonUp',
		'receivedBlueButtonDown'
	],
	#category : #SUnit-UITesting,
	#timestamp : 'SeanDeNigris 2/20/2014 08:53'
}

{
	#category : #meta-actions,
	#timestamp : ' 8/31/2017 05:26:20'
}
MorphHandlingMiddleButton>>blueButtonDown: anEvent [

	receivedBlueButtonDown := true.
]

{
	#category : #meta-actions,
	#timestamp : ' 8/31/2017 05:26:20'
}
MorphHandlingMiddleButton>>blueButtonUp: anEvent [

	receivedBlueButtonUp := true.
]

{
	#category : #meta-actions,
	#timestamp : ' 8/31/2017 05:26:20'
}
MorphHandlingMiddleButton>>handlerForBlueButtonDown: anEvent [

	^ self.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:20'
}
MorphHandlingMiddleButton>>initialize [

	super initialize.
	receivedBlueButtonUp := receivedBlueButtonDown := false.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:20'
}
MorphHandlingMiddleButton>>wasClickedWithMiddleButton [

	^ receivedBlueButtonDown and: [ receivedBlueButtonUp ].
]
