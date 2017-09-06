"
I am ZnStreamingEntity, a concrete HTTP Entity based on a stream.
I am a ZnEntity.

When a ZnStreamingEntity is created using #readFrom: 
its content type and length are set but no body is actually read.
Instead, stream is set to a ZnLimitedReadStream that clients can/must
use to read from.

When the client is done, either all data must be read or #consumeContent must be called.
A client should normally not close the stream.

A ZnStreamingEntity can also be instanciated with an existing read stream.
During #writeOn: this stream is copied to the output stream.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnStreamingEntity,
	#superclass : #ZnEntity,
	#instVars : [
		'stream'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : 'SvenVanCaekenberghe 8/18/2011 14:48'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity class>>designatedMimeType [
	"I have no designated mime type, I can handle all content.
	See #concreteSubclassForType: "
	
	^ nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity class>>matches: mimeType [
	"I have no designated mime type, I can handle all content.
	See #concreteSubclassForType: "
	
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity class>>readFrom: stream usingType: mimeType andLength: length [
	"Create and return a new streaming entity of mimeType and length from stream.
	Clients can/must use the embedded ZnLimitedReadStream to read all content, 
	or call #consumeContent when they are done. They should not close the stream."
	
	^ (self type: mimeType length: length)
		readFrom: stream;
		yourself

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>close [
	stream ifNotNil: [ 
		stream close. 
		stream := nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>consumeContent [
	"To be improved later on using some kind of larger buffer"
	
	[ self stream atEnd ] 
		whileFalse: [ self stream next ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>contents [
	"Since this is a non-repeatable entity, 
	#contents will #consumeContent, 
	this can thus only be done once"
	
	stream ifNil: [ ^ nil ].
	^ ZnUtils readUpToEnd: self stream limit: ZnMaximumEntitySize value
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>isEmpty  [
	"We actually don't know"
	
	^ false
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>readFrom: readStream [
	self contentLength isNil
		ifTrue: [ 
			self stream: readStream ]
		ifFalse: [ | limitedStream |
			limitedStream := ZnLimitedReadStream on: readStream limit: self contentLength.
			self stream: limitedStream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>readStream  [
	^ self stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>stream  [
	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>stream: readStream [
	stream := readStream
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStreamingEntity>>writeOn: outputStream [
	(self contentLength isNil or: [ self contentLength = 0 ])
		ifTrue: [ 
			ZnUtils 
				streamFrom: self stream 
				to: outputStream ]
		ifFalse: [
			ZnUtils 
				streamFrom: self stream 
				to: outputStream 
				size: self contentLength ].
	self close
]
