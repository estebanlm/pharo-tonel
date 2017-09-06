"
STONTestAssociation is used to support unit tests.

"
Class {
	#name : #STONTestAssociation,
	#superclass : #Association,
	#instVars : [
		'timestamp'
	],
	#category : #STON-Tests,
	#timestamp : 'SvenVanCaekenberghe 8/15/2015 16:59'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestAssociation>>key: aKey value: anObject  [
	super key: aKey value: anObject.
	timestamp := self now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestAssociation>>now [
	^ DateAndTime now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestAssociation>>timestamp [
	^ timestamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONTestAssociation>>value: anObject [
	super value: anObject.
	timestamp := self now
]
