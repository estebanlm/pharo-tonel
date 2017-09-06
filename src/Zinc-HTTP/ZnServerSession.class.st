"
I am ZnServerSession.
I represent an HTTP session in the context of a ZnServer.

To get a reference to the current session, send #session to a ZnMessage (request or response).

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnServerSession,
	#superclass : #Object,
	#instVars : [
		'id',
		'attributes',
		'created',
		'modified'
	],
	#category : #Zinc-HTTP-Support,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>age [
	^ DateAndTime now - created
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>attributeAt: key [
	^ attributes at: key
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>attributeAt: key ifAbsent: block [
	^ attributes at: key ifAbsent: block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>attributeAt: key ifAbsentPut: block [
	^ attributes at: key ifAbsentPut: block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>attributeAt: key put: value [
	^ attributes at: key put: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>attributeKeys [
	^ attributes keys
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>created [
	^ created
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>id [
	^ id
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>id: anObject [
	id := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>inactivity [
	^ DateAndTime now - modified 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>initialize [
	super initialize.
	attributes := SmallDictionary new.
	created := modified := DateAndTime now
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>isValid [
	^ self inactivity < 1 hour
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>modified [
	^ modified
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>printOn: stream [
	super printOn: stream.
	id
		ifNotNil: [ 
			stream
				nextPut: $(;
				print: id;
				nextPut: $) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>removeAttribute: key [
	attributes removeKey: key ifAbsent: [ ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnServerSession>>touch [
	modified := DateAndTime now
]
