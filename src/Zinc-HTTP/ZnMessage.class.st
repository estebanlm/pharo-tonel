"
I am ZnMessage, an abstract class representing an HTTP Message.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnMessage,
	#superclass : #Object,
	#instVars : [
		'headers',
		'entity'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : 'SvenVanCaekenberghe 12/6/2010 12:46'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage class>>readBinaryFrom: stream [
	^ self new
		readBinaryFrom: stream;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage class>>readFrom: stream [
	^ self new
		readFrom: stream;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage class>>readHeaderFrom: stream [
	^ self new
		readHeaderFrom: stream;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage class>>readStreamingFrom: stream [
	^ self new
		readStreamingFrom: stream;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>= other [
	self class = other class ifFalse: [ ^ false ].
	^ self headers = other headers and: [ self entity = other entity ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>clearEntity [
	"Set my entity to nil. 
	Unlike #resetEntity:, my content type and length remain unchanged."

	entity ifNotNil: [
		entity close.
		entity := nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>contentLength [
	self hasEntity ifTrue: [ ^ self entity contentLength ].
	(self hasHeaders and: [ self headers hasContentLength ]) ifTrue: [ ^ self headers contentLength ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>contentType [
	self hasEntity ifTrue: [ ^ self entity contentType ].
	(self hasHeaders and: [ self headers hasContentType ]) ifTrue: [ ^ self headers contentType ].
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>contents [
	^ entity isNil ifTrue: [ nil ] ifFalse: [ entity contents ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>cookies [
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>entity [
	^ entity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>entity: object [
	"Set my entity to object. Unless I already am describing an entity using my content type and length
	set my content type and length as defined by object."

	entity := object.
	self headers isDescribingEntity ifFalse: [
		self headers acceptEntityDescription: object ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>entityReaderOn: stream [
	^ ZnEntityReader new
		headers: self headers;
		stream: stream;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>entityWriterOn: stream [
	^ ZnEntityWriter new
		headers: self headers;
		stream: stream;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>hasEntity [
	^ self entity notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>hasHeaders [
	^ headers notNil and: [ self headers isEmpty not ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>hasSession [
	"Return if there currently is a server session.
	This only returns a value during #handleRequest:"

	^ ZnCurrentServerSession value notNil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>hash [
	^ self headers hash bitXor: self entity hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>headers [
	headers isNil ifTrue: [ headers := ZnHeaders new ].
	^ headers
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>headers: object [
	headers := object
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>headersDo: twoArgumentBlock [
	self hasHeaders
		ifTrue: [ self headers headersDo: twoArgumentBlock ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>isConnectionClose [
	| value |
	value := self headers at: 'Connection' ifAbsent: [ ^ false ].
	^ value sameAs: 'close'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>isConnectionKeepAlive [
	| value |
	value := self headers at: 'Connection' ifAbsent: [ ^ false ].
	^ value sameAs: 'keep-alive'
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>postCopy [
	headers := headers copy.
	"Note that we don't copy the entity, see also #resetEntity: and ZnClient>>#resetEntity"
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>readBinaryFrom: stream [
	| entityReader |
	self readHeaderFrom: stream.
	(entityReader := self entityReaderOn: stream)
		binary.
	self entity: entityReader readEntity
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>readEntityFrom: stream [
	self entity: (self entityReaderOn: stream) readEntity
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>readFrom: stream [
	self readHeaderFrom: stream.
	self readEntityFrom: stream
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>readHeaderFrom: stream [
	self headers: (ZnHeaders readFrom: stream)
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>readStreamingFrom: stream [
	| entityReader |
	self readHeaderFrom: stream.
	(entityReader := self entityReaderOn: stream)
		streaming.
	self entity: entityReader readEntity
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>resetEntity: object [
	"Set my entity to object. Always set my content type and length as defined by object,
	even if I am already describing an entity using my content type and length.
	See also: #clearEntity"

	(entity ~= object and: [ entity notNil ]) 
		ifTrue: [ entity close ].
	entity := object.
	self headers acceptEntityDescription: object
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>server [
	"Return the current server.
	This only returns a value during #handleRequest:"

	^ ZnCurrentServer value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>session [
	"Return the current server session.
	This only returns a value during #handleRequest:"

	^ ZnCurrentServerSession value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>setConnectionClose [
	self headers at: 'Connection' put: 'close'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>setConnectionKeepAlive [
	self headers at: 'Connection' put: 'keep-alive'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>setContentType: mimeType [
	"Explicitly set my Content-Type to mimeType.
	I normally do this automatically by taking the #contentType from my entity."
	
	self headers contentType: mimeType
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>wantsConnectionClose [
	"Return if the HTTP protocol should close the connection after processing the receiver"
	
	^ false
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>writeOn: stream [
	| bivalentWriteStream |
	bivalentWriteStream := ZnBivalentWriteStream on: stream.
	self headers writeOn: bivalentWriteStream.
	bivalentWriteStream nextPutAll: String crlf.
	self hasEntity ifTrue: [ 
		(self entityWriterOn: bivalentWriteStream) writeEntity: self entity ]
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnMessage>>writeToTranscript [
	"Write the receiver on the Transcript like when sent or received over the network.
	Useful for debugging, obviously"
	
	self writeOn: Transcript.
	Transcript flush
]
