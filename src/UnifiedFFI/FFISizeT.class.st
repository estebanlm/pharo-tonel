"
I'm a size_t type. 
I can change in different architectures (32/64bits)

WARNING: I'm just implemented 32bits!
"
Class {
	#name : #FFISizeT,
	#superclass : #FFIIntegerType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT class>>asExternalTypeOn: generator [
	"We resolve size_t to a uint/ulong which may be not the case always"
	^ generator resolveType: #ulong
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT class>>externalType  [
	^ ExternalType long
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT class>>externalTypeAlignment [
	^ Smalltalk wordSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT class>>externalTypeSize [
	^ Smalltalk wordSize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT>>basicHandle: aHandle at: index [
	^ aHandle platformUnsignedLongAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT>>basicHandle: aHandle at: index put: value [
	^ aHandle platformUnsignedLongAt: index put: value
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT>>readFieldAt: byteOffset [
	self isPointer ifTrue: [ 
		^ self pointerReadFieldAt: byteOffset ].

	^ String streamContents: [ :stream |
		stream << '^handle platformUnsignedLongAt: ' << byteOffset asString ].

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFISizeT>>writeFieldAt: byteOffset with: valueName [
	self isPointer ifTrue: [ 
		^ self externalTypeWithArity 
			writeFieldAt: byteOffset
			with: valueName ].

	^ String streamContents: [ :stream |
		stream 
			<< '^handle platformUnsignedLongAt: ' << byteOffset asString
			<< ' put: ' << valueName ]

]
