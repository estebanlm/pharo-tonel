"

"
Class {
	#name : #GTSpotterStreamMock,
	#superclass : #Object,
	#instVars : [
		'objects'
	],
	#category : #GT-Tests-Spotter,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterStreamMock>>addObject: anObject inProcessor: aProcessor [
	objects add: anObject
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterStreamMock>>initialize [
	super initialize.
	objects := OrderedCollection new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterStreamMock>>objects [
	^ objects
]
