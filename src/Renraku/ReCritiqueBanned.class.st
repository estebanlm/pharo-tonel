"
Announced when a critic gets banned.
"
Class {
	#name : #ReCritiqueBanned,
	#superclass : #ReSingleCritiqueEvent,
	#instVars : [
		'entityBanLevel'
	],
	#category : #Renraku-Announcements,
	#timestamp : 'YuriyTymchuk 8/29/2015 21:52'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReCritiqueBanned>>entityBanLevel [
	^ entityBanLevel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReCritiqueBanned>>entityBanLevel: anObject [
	entityBanLevel := anObject
]
