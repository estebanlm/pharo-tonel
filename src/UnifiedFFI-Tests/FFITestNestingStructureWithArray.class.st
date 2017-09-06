"

"
Class {
	#name : #FFITestNestingStructureWithArray,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_NESTED'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructureWithArray class>>fieldsDesc [
" self rebuildFieldAccessors "
	^ #(
			FFITestArrayStructure nested;
		)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructureWithArray>>nested [
	"This method was automatically generated"
	^FFITestArrayStructure fromHandle: (handle referenceStructAt: OFFSET_NESTED length: 15)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructureWithArray>>nested: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_NESTED put: anObject getHandle length: 15.
]
