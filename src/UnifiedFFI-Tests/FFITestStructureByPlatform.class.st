"

"
Class {
	#name : #FFITestStructureByPlatform,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_LONG',
		'OFFSET_POINTER'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureByPlatform class>>fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	ulong long;
	void *pointer;
	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureByPlatform>>long [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_LONG
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureByPlatform>>long: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_LONG put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureByPlatform>>pointer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_POINTER) type: ExternalType void asPointerType
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureByPlatform>>pointer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_POINTER put: anObject getHandle.
]
