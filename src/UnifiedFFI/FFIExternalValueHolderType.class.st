"
I'm an external value holder type (see ==FFIExternalValueHolder==  comment).
"
Class {
	#name : #FFIExternalValueHolderType,
	#superclass : #FFIExternalReferenceType,
	#instVars : [
		'representationType'
	],
	#category : #UnifiedFFI-Types,
	#timestamp : 'EstebanLorenzano 3/17/2016 13:43'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType class>>objectClass: aClass [
	^ self objectClass: aClass representationType: FFIUInt32 new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType class>>objectClass: aClass representationType: anIntegerType [
	^ self new
		objectClass: aClass;
		representationType: anIntegerType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>externalType [
	^ self representationType externalType asPointerType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>externalTypeSize  [
	^ self pointerSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>instanceVariableName [
	^ #data
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>offsetReadFieldAt: offsetVariableName [
	^ self notYetImplemented
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>offsetWriteFieldAt: offsetVariableName with: valueName [
	^ self notYetImplemented
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>readFieldAt: byteOffset	 [
	^ self notYetImplemented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>representationType [
	^ representationType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>representationType: anObject [
	representationType := anObject
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalValueHolderType>>writeFieldAt: byteOffset with: valueName [
	^ self notYetImplemented
]
