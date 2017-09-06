"
FreeType externalMemory 
"
Class {
	#name : #FreeTypeExternalMemory,
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
FreeTypeExternalMemory class>>bytes: aByteArray [
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
FreeTypeExternalMemory>>bytes [
	^bytes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeExternalMemory>>bytes: aByteArray [
	bytes := aByteArray
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeExternalMemory>>primCopyToExternalMemory: aByteArray [
	"copy aByteArray into newly allocated, external memory, and store the
	address of that memory in the receiver's handle"
	<primitive: 'primitiveCopyToExternalMemory' module: 'FT2Plugin'>
	^self primitiveFailed
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeExternalMemory>>primDestroyHandle [
	<primitive: 'primitiveFreeExternalMemory' module: 'FT2Plugin'>
	^self primitiveFailed
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 05:26:12'
}
FreeTypeExternalMemory>>validate [
	self isValid ifTrue: [ ^ self ].
	bytes ifNil: [ ^ self  ].
	
	self primCopyToExternalMemory: bytes.
	self isValid ifTrue: [ self class register: self ]
]
