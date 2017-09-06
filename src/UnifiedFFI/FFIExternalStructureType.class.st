"
I'm a type to handle structures. 
"
Class {
	#name : #FFIExternalStructureType,
	#superclass : #FFIExternalType,
	#instVars : [
		'objectClass',
		'structureSize'
	],
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType class>>naturalPointerArity [
	^ 1
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType class>>objectClass: aClass [
	^ self basicNew 
		initializeObjectClass: aClass;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>basicHandle: aHandle at: index [
	^ self objectClass fromHandle: (aHandle referenceStructAt: index length: self externalTypeSize)

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>basicHandle: aHandle at: index put: value [
	^ LibC memCopy: value getHandle to: aHandle size: self externalTypeSize

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>callbackValueFor: anAlien at: index [
	"This is the value for a callback.
	since the callbacks comunicates as Aliens, I receive the struct, but with an Alien 
	reference (which does not work for UFFI structires, they needs to be ExternalAddress)"
	self isPointer ifTrue: [ ^ anAlien pointerAt: index ].
	^ self objectClass fromHandle: (ExternalAddress fromAddress: anAlien address)
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>emitFlatStructureLayoutFieldInto: flatStructureLayout [
	objectClass emitFlatStructureLayoutFieldInto: flatStructureLayout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>externalType  [
	^ ExternalType structTypeNamed: self objectClass name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>externalTypeAlignment  [
	^ self objectClass structureAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>externalTypeSize  [
	^ self objectClass structureSize
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>initializeObjectClass: aClass [
	objectClass := aClass.
	self initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>objectClass [
	^ objectClass
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>offsetReadFieldAt: offsetVariableName [
	"Return a string defining the accessor to an entity of the receiver type starting at the given byte offset. "
	self isPointer ifTrue: [ ^ super offsetReadFieldAt: offsetVariableName ].
	^ self offsetReadReferenceAt: offsetVariableName
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>offsetReadReferenceAt: offsetVariableName [
	^ '^ {1} fromHandle: (handle referenceStructAt: {2} length: {1} byteSize)'
		format: { self objectClass name. offsetVariableName }
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>prepareAsSelfFromCalloutDeclaration [
	"self starts with pointer arity 1 (regardless how is declared later)"
	self pointerArity: 1
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>readFieldAt: byteOffset [
	"Return a string defining the accessor to an entity of the receiver type starting at the given byte offset. "
	self isPointer ifTrue: [ ^ super readFieldAt: byteOffset ].
	^ self readReferenceAt: byteOffset
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>readReferenceAt: byteOffset [
	^ '^ {1} fromHandle: (handle referenceStructAt: {2} length: {1} byteSize)'
		format: { 
			self objectClass name.
			byteOffset }
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalStructureType>>stackValueParameterClass [
	^ #structure
]
