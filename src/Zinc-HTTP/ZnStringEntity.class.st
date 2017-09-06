"
I am ZnStringEntity, a concrete HTTP Entity based on a String.
It is used to hold textual (non-binary) data.
I am a ZnEntity.

Optionally, an encoding is used to convert to and from bytes.
The default encoding it UTF-8.

Note that content length is the encoded byte count, not the number of characters in the string.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnStringEntity,
	#superclass : #ZnEntity,
	#instVars : [
		'string',
		'encoder'
	],
	#category : #Zinc-HTTP-Core,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity class>>designatedMimeType [
	"I have no designated mime type, I can handle all non-binary content.
	See #concreteSubclassForType: "
	
	^ nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity class>>html: string [
	^ (self type: ZnMimeType textHtml)
		string: string;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity class>>matches: mimeType [
	"I have no designated mime type, I can handle all non-binary content.
	See #concreteSubclassForType: "
	
	^ false
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity class>>text: string [
	^ (self type: ZnMimeType textPlain)
		string: string;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity class>>xml: string [
	^ (self type: ZnMimeType applicationXml)
		string: string;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>= other [
	^ super = other and: [ self string = other string ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>computeContentLength [
	self string isNil ifTrue: [ ^ self ].
	contentLength := self encoder encodedByteCountForString: string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>contentLength [
	contentLength isNil ifTrue: [ self computeContentLength ].
	^ contentLength
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>contentType: object [
	"We only allow assignment compatible with our designated mime type"
	
	| newType |
	newType := object asZnMimeType.
	contentType = newType 
		ifTrue: [ ^ self ]
		ifFalse: [ 
			newType isBinary
				ifFalse: [ 
					contentType := newType.
					self invalidateEncoder ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>contents [
	^ self string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>encoder [
	self initializeEncoder.
	^ encoder
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>encoder: anEncoding [
	(encoder notNil and: [ anEncoding ~= encoder ]) ifTrue: [ self invalidateContentLength ].
	encoder := anEncoding
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>hasEncoder [
	^ encoder notNil
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>hash [
	^ super hash bitXor: self string hash
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>initializeEncoder [
	"If the content-type specifies an encoding, use that.
	If not, use the value of ZnDefaultCharacterEncoder,
	if that is not set, fall back to UTF-8"
	
	| charSet newEncoder |
	self hasEncoder
		ifTrue: [ ^ self ].
	newEncoder := (charSet := contentType charSet) isNil
		ifTrue: [ ZnDefaultCharacterEncoder value ]
		ifFalse: [ 
			(ZnCharacterEncoder newForEncoding: charSet)
				beLenient;
				yourself ].
	self encoder: newEncoder
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>invalidateContentLength [
	self contentLength: nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>invalidateEncoder [
	self encoder: nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>isEmpty [
	^ self string isNil or: [ self string isEmpty ] 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>printContentsOn: stream [
	super printContentsOn: stream.
	self string notNil ifTrue: [ 
		stream space; nextPutAll: self string ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>readFrom: stream [
	| buffer totalRead read readStream stringStream total |
	total := self contentLength.
	readStream := total ifNotNil: [ ZnLimitedReadStream on: stream limit: total ] ifNil: [ stream ].
	buffer := String new: (ZnUtils streamingBufferSize min: (total ifNil: [ ZnUtils streamingBufferSize ])).
	stringStream := nil.
	totalRead := 0.
	self initializeEncoder.
	[ readStream atEnd ] whileFalse: [
		[ read := encoder readInto: buffer startingAt: 1 count: buffer size fromStream: readStream ]
			on: ZnByteStringBecameWideString 
			do: [ :notification | 
					buffer := notification wideString.
					stringStream ifNotNil: [ | wideString position |
						position := stringStream position.
						wideString := WideString from: stringStream originalContents.
						stringStream on: wideString; setFrom: position + 1 to: position ].
					notification resume ].
		totalRead := totalRead + read.
		totalRead > ZnMaximumEntitySize value
			ifTrue: [ ZnEntityTooLarge signal ].
		stringStream ifNil: [ 
			readStream atEnd
				ifTrue: [ ^ self string: (buffer copyFrom: 1 to: read) ]
				ifFalse: [ stringStream := (total ifNil: [ buffer species new ] ifNotNil: [ buffer species new: total ]) writeStream ] ].
		stringStream next: read putAll: buffer startingAt: 1.
		ZnUtils signalProgress: totalRead total: total ].
	self string: (stringStream ifNil: [ String new ] ifNotNil: [ stringStream contents ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>readStream [
	^ self string readStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>string [
	^ string
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>string: aString [
	(string notNil and: [ aString ~= string ]) ifTrue: [ self invalidateContentLength ].
	string := aString
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:19'
}
ZnStringEntity>>writeOn: stream [
	| totalWritten toWrite total  |
	self initializeEncoder.
	totalWritten := 0.
	total := string size.
	[ totalWritten < total ] whileTrue: [ 
		toWrite := ZnUtils streamingBufferSize min: (total - totalWritten).
		encoder next: toWrite putAll: string startingAt: totalWritten + 1 toStream: stream.
		totalWritten := totalWritten + toWrite.
		ZnUtils signalProgress: totalWritten total: total ]
]
