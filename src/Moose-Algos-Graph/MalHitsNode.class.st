"

"
Class {
	#name : #MalHitsNode,
	#superclass : #MalNodeWithPreviousAndNext,
	#instVars : [
		'auth',
		'hub'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHitsNode>>auth [
	^ auth
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHitsNode>>auth: anObject [
	auth := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHitsNode>>hub [
	^ hub
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHitsNode>>hub: anObject [
	hub := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHitsNode>>label [

	^ 'H '
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalHitsNode>>printString [

	^ 	'(',
		self model printString,
		' ',
		(self auth printShowingDecimalPlaces: 2),
		' ',
		(self hub printShowingDecimalPlaces: 2),
		') '
]
