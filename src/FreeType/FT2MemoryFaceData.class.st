"
Freetype 2 MemoryFace data  
"
Class {
	#name : #FT2MemoryFaceData,
	#superclass : #FT2Handle,
	#instVars : [
		'bytes'
	],
	#category : #FreeType-Base,
	#timestamp : 'TorstenBergmann 2/4/2014 22:06'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData class>>bytes: aByteArray [
	| answer |
	answer := self basicNew
		bytes: aByteArray;
		yourself.
	^answer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData>>bytes [
	^bytes
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData>>bytes: aByteArray [

	bytes := aByteArray.
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData>>free [
	^self destroyHandle
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData>>primDestroyHandle [
	<primitive: 'primitiveFreeMemoryFaceData' module: 'FT2Plugin'>
	^self primitiveFailed.
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData>>primMalloc: aByteArray [
	"copy aByteArray into newly allocated, external memory, and store the
	address of that memory in the receiver's handle"
	<primitive: 'primitiveMallocMemoryFaceData' module: 'FT2Plugin'>
	^self primitiveFailed
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2MemoryFaceData>>validate [
	self isValid ifTrue: [ ^ self ].
	bytes ifNil: [ ^ self ].
	
	self primMalloc: bytes.
	self isValid ifTrue:[ self class register: self ]
]
