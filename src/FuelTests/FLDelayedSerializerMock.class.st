"

"
Class {
	#name : #FLDelayedSerializerMock,
	#superclass : #FLSerializer,
	#category : #FuelTests-Mocks,
	#timestamp : ''
}

{
	#category : #protected,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLDelayedSerializerMock>>setDefaultSerialization [

	^ serializationFactory := [:anObject :anEncoder | 
		(FLDelayedSerializationMock 
			with: anEncoder
			root: anObject 
			analyzer: self analyzer)
			run;
			yourself ]
]
