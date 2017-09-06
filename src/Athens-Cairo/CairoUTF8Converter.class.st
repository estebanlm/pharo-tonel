"
i use persistent buffer to convert strings to utf-8 strings (an input neede by cairo)
"
Class {
	#name : #CairoUTF8Converter,
	#superclass : #Object,
	#instVars : [
		'buffer',
		'len',
		'asm',
		'encoder',
		'bs'
	],
	#category : #Athens-Cairo-Text,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoUTF8Converter>>buffer [
	^ buffer
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoUTF8Converter>>checkBufferSpace: minimalSize [
	| size |
	
	size := buffer ifNil: [ 0 ] ifNotNil: [ buffer size ].
	
	size < minimalSize ifTrue: [
		buffer := ByteArray new: minimalSize.
		bs := buffer writeStream.
		
		]

]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoUTF8Converter>>convert: aString from: start to: end [

	self checkBufferSpace: 4*(end-start + 2).
	bs reset.
	
	encoder next: end-start+1 
		putAll: aString 
		startingAt: start 
		toStream: bs .
		
	"DO NOT NULL-Terminate because its not used"

	^ bs position.
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoUTF8Converter>>convertChar: aCharacter  [

	self checkBufferSpace: 8.

	bs reset.
	encoder nextPut: aCharacter toStream: bs.
	bs nextPut: 0.
	^ buffer
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:26'
}
CairoUTF8Converter>>initialize [
	encoder := ZnUTF8Encoder new.
]
