"
I am a structure that in the AMD64 SystemV ABI is passed in 1 integer register, and in 1 float register.
"
Class {
	#name : #FFITestStructureSmallIntFloatStructure,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_W',
		'OFFSET_X',
		'OFFSET_Y',
		'OFFSET_Z'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : 'RonieSalgado 2/14/2017 01:57'
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure class>>fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	float x;
	int y;
	float z;
	float w;
	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>y [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_Y
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>y: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_Y put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallIntFloatStructure>>z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
