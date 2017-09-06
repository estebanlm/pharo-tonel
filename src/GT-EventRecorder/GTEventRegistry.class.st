"
I am weak holder of an object that uses GTEventCollector. If the object disappears from object memory (or #liberate message is sent), GTEventCollector can be removed from a GTEventRecorder object.

For the Collaborators Part: GTEventCollector

Public API and Key Messages

- object: 
- liberate
- isLiberated

Internal Representation and Key Implementation Points.

    Instance Variables
	weakHolder:		<Object>

"
Class {
	#name : #GTEventRegistry,
	#superclass : #Object,
	#instVars : [
		'weakHolder'
	],
	#category : #GT-EventRecorder-Support,
	#timestamp : 'JurajKubelka 11/16/2015 19:59'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRegistry>>initialize [
	super initialize.
	weakHolder := WeakArray new: 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRegistry>>isLiberated [
	^ (weakHolder at: 1) isNil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRegistry>>liberate [
	self object: nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRegistry>>object: anObject  [
	weakHolder at: 1 put: anObject.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTEventRegistry>>printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: (self isLiberated ifTrue: [ 'liberated' ] ifFalse: [ 'used' ]);
		nextPut: $)
]
