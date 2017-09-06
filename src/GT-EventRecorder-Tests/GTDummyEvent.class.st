"
I represent an object that is kept by a GTEventCollector. I serve only for the testing purpose.
"
Class {
	#name : #GTDummyEvent,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #GT-EventRecorder-Tests-Support,
	#timestamp : 'JurajKubelka 11/15/2015 17:53'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDummyEvent>>= aDummyEvent [
	^ self class = aDummyEvent class and: [ 
		self data = aDummyEvent data ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDummyEvent>>data [
	^ data
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDummyEvent>>data: anObject [
	data := anObject
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTDummyEvent>>hash [
	^ self class hash bitXor: self data
]
