"
I define the type for FFIExternalArray objects.
"
Class {
	#name : #FFIExternalArrayType,
	#superclass : #FFIExternalReferenceType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalArrayType>>instanceVariableName [
	^ #handle
]
