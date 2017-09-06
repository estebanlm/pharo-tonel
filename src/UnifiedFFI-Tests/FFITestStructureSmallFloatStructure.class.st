"
I am a structure that in the AMD64 SystemV ABI is passed in 2 float registers.
"
Class {
	#name : #FFITestStructureSmallFloatStructure,
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
FFITestStructureSmallFloatStructure class>>fieldsDesc [
	"self rebuildFieldAccessors"
	^ #(
	float x;
	float y;
	float z;
	float w;
	)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>w [
	"This method was automatically generated"
	^handle floatAt: OFFSET_W
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>w: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_W put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>x [
	"This method was automatically generated"
	^handle floatAt: OFFSET_X
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>x: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_X put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>y [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Y
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>y: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Y put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>z [
	"This method was automatically generated"
	^handle floatAt: OFFSET_Z
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestStructureSmallFloatStructure>>z: anObject [
	"This method was automatically generated"
	handle floatAt: OFFSET_Z put: anObject
]
