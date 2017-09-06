"
I define the type for FFIExternalEnumeration objects.
"
Class {
	#name : #FFIExternalEnumerationType,
	#superclass : #FFIExternalReferenceType,
	#instVars : [
		'representationType'
	],
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType class>>naturalPointerArity [
	^ 0
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType class>>objectClass: aClass [
	^ self objectClass: aClass representationType: FFIUInt32 new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType class>>objectClass: aClass representationType: anIntegerType [
	^ self new
		objectClass: aClass;
		representationType: anIntegerType
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>basicHandle: aHandle at: index [
	^ self objectClass fromInteger: (aHandle 
		perform: self externalType atomicSelector 
		with: index)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>basicHandle: aHandle at: index put: value [
	^ aHandle 
		perform: (self externalType atomicSelector,#put:) asSymbol
		with: index
		with: value getHandle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>callbackReturnOn: callbackContext for: anObject [
    ^ super callbackReturnOn: callbackContext for: anObject value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>externalType [
	^ self representationType externalType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>externalTypeAlignment [
	^ self representationType externalTypeAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>externalTypeSize  [
	^ self representationType externalTypeSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>instanceVariableName [
	^ #value
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>offsetReadEnumAt: offsetVariableName [
	^ String streamContents:[ :stream|
		stream 
			nextPutAll:'^';
			print: self objectClass;
			nextPutAll:' fromInteger: (handle ', self externalType atomicSelector,' ';
			nextPutAll: offsetVariableName;
			nextPutAll:')' ].

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>offsetReadFieldAt: offsetVariableName [
	"Return a string defining the accessor to an entity of the receiver type starting at the given byte offset. "
	self isPointer ifTrue: [ ^ super offsetReadFieldAt: offsetVariableName ].
	^ self offsetReadEnumAt: offsetVariableName
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>offsetWriteFieldAt: offsetVariableName with: valueName [
	^ String streamContents: [ :stream | 
		stream << 'handle ' << self externalType atomicSelector << ' ' << offsetVariableName << ' put: anObject value' ]
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>readEnumAt: byteOffset [
	^ String streamContents:[ :stream|
		stream 
			nextPutAll:'^';
			print: self objectClass;
			nextPutAll:' fromInteger: (handle ', self externalType atomicSelector,' ';
			print: byteOffset;
			nextPutAll:')' ].

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>readFieldAt: byteOffset [
	"Return a string defining the accessor to an entity of the receiver type starting at the given byte offset. "
	self isPointer ifTrue: [ ^ super readFieldAt: byteOffset ].
	^ self readEnumAt: byteOffset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>representationType [
	^ representationType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>representationType: anObject [
	representationType := anObject
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationType>>writeFieldAt: byteOffset with: valueName [
	^ String streamContents: [ :stream | 
		stream << 'handle ' << self externalType atomicSelector << ' ' << byteOffset asString << ' put: anObject value' ]
]
