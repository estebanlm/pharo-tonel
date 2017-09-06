"
I'm en external object type (a pointer)
"
Class {
	#name : #FFIExternalObjectType,
	#superclass : #FFIExternalReferenceType,
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 3/17/2016 13:37'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalObjectType>>initialize  [
	super initialize.
	pointerArity := self class naturalPointerArity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalObjectType>>instanceVariableName [
	^ #handle
]
