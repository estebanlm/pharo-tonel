"
I'm an unsigned long.
Longs are different from other types because they can have different sizes depending on the architecture, reason why they need a special treatment (and we cannot reduce them to a int32 or int64 type). 
For example, this are the sizes according architecture: 

- i386: 4 bytes
- x86_64 SystemV: 8 bytes
- x86_64 Windows: 4 bytes

So we model long as a special type and we use platform speciphic settings.
"
Class {
	#name : #FFIULong,
	#superclass : #FFIIntegerType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong class>>externalType  [
	^ FFIArchitecture forCurrentArchitecture externalULongType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong class>>externalTypeAlignment [
	^ OSPlatform current ffiLongAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong class>>externalTypeSize [
	^ FFIArchitecture forCurrentArchitecture longTypeSize
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>basicHandle: aHandle at: index [
	^ aHandle platformUnsignedLongAt: index	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>basicHandle: aHandle at: index put: value  [
	^ aHandle platformUnsignedLongAt: index put: value

]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>emitSelector [
	^ 'platformUnsignedLongAt'
]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>offsetPointerReadFieldAt: offsetVariableName [
	^ '^ExternalData 
		fromHandle: (handle {1}: {2})
		type: FFIArchitecture forCurrentArchitecture externalULongType asPointerType'
	format: { 
		self emitSelector.
		offsetVariableName }
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>offsetReadFieldAt: offsetVariableName [
	self isPointer ifTrue: [ 
		^ self offsetPointerReadFieldAt: offsetVariableName ].
	
	^ String streamContents: [ :stream |
		stream << '^handle ' << self emitSelector << ': ' << offsetVariableName ]
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>offsetWriteFieldAt: offsetVariableName with: valueName [
	self isPointer ifTrue: [ 
		^ self externalTypeWithArity 
			offsetWriteFieldAt: offsetVariableName 
			with: valueName ].

	^ String streamContents: [ :stream |
		stream 
			<< '^handle ' << self emitSelector << ': ' << offsetVariableName 
			<< ' put: ' << valueName ]
]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>pointerReadFieldAt: byteOffset [
	"since offsetPointerReadFieldAt: receives a variable no matter what we use the trick of 
	 just passing the offset as a string... it will work :)"
	^ self offsetPointerReadFieldAt: byteOffset asString
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>readFieldAt: byteOffset [
	self isPointer ifTrue: [ 
		^ self pointerReadFieldAt: byteOffset ].

	^ String streamContents: [ :stream |
		stream << '^handle ' << self emitSelector << ': ' << byteOffset asString ].

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIULong>>writeFieldAt: byteOffset with: valueName [
	self isPointer ifTrue: [ 
		^ self externalTypeWithArity 
			writeFieldAt: byteOffset
			with: valueName ].

	^ String streamContents: [ :stream |
		stream 
			<< '^handle ' << self emitSelector << ': ' << byteOffset asString
			<< ' put: ' << valueName ]

]
