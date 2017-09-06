"

"
Class {
	#name : #FFITestPointerStructure,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_NESTEDPOINTER',
		'OFFSET_ONE',
		'OFFSET_POINTER',
		'OFFSET_TWO'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure class>>fieldsDesc [
" self rebuildFieldAccessors "
	^ #(
		byte one;
		long two;
		void *pointer;
		FFITestStructure *nestedPointer;
		)
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure class>>initialize [
	"self rebuildFieldAccessors"
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>nestedPointer [
	"This method was automatically generated"
	^FFITestStructure fromHandle: (handle pointerAt: OFFSET_NESTEDPOINTER)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>nestedPointer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NESTEDPOINTER put: anObject getHandle.
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>one [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_ONE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>one: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_ONE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>pointer [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_POINTER) type: ExternalType void asPointerType
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>pointer: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_POINTER put: anObject getHandle.
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>two [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_TWO
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestPointerStructure>>two: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_TWO put: anObject
]
