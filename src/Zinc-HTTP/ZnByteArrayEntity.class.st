"
I am ZnByteArrayEntity, a concrete HTTP Entity based on a ByteArray.
It is used to hold binary (non textual) data.
I am a ZnEntity.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnByteArrayEntity,
	#superclass : #ZnEntity,
	#instVars : [
		'bytes'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : 'SvenVanCaekenberghe 1/18/2011 11:04'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity class>>bytes: byteArray [
	^ (self type: ZnMimeType applicationOctetStream length: byteArray size)
		bytes: byteArray;
		yourself 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity class>>designatedMimeType [
	"I have no designated mime type, I can handle all binary content.
	See #concreteSubclassForType: "
	
	^ nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity class>>matches: mimeType [
	"I have no designated mime type, I can handle all binary content.
	See #concreteSubclassForType: "
	
	^ false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>= other [
	^ super = other and: [ self bytes = other bytes ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>bytes [
	^ bytes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>bytes: anObject [
	bytes := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>contents [
	^ self bytes
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>hash [
	^ super hash bitXor: self bytes hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>isEmpty [
	^ self bytes isNil or: [ self bytes isEmpty ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>printContentsOn: stream [
	super printContentsOn: stream.
	self bytes notNil ifTrue: [ 
		stream space; print: self bytes ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>readFrom: stream [
	self contentLength isNil
		ifTrue: [ 
			self bytes: (ZnUtils readUpToEnd: stream limit: ZnMaximumEntitySize value).
			self contentLength: self bytes size ]
		ifFalse: [ | byteArray |
			self contentLength > ZnMaximumEntitySize value
				ifTrue: [ ZnEntityTooLarge signal ].
			byteArray := ByteArray ofSize: self contentLength.
			self contentLength > ZnUtils streamingBufferSize 
				ifTrue: [
					ZnUtils streamFrom: stream to: byteArray writeStream size: self contentLength ]
				ifFalse: [
					stream next: self contentLength into: byteArray ]. 
			self bytes: byteArray ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>readStream [
	^ self bytes readStream
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnByteArrayEntity>>writeOn: stream [
	ZnUtils nextPutAll: self bytes on: stream
]
