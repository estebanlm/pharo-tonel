"

"
Class {
	#name : #FFITestNestingStructure,
	#superclass : #FFIExternalStructure,
	#classVars : [
		'OFFSET_NESTED',
		'OFFSET_ONE',
		'OFFSET_TWO'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #'field definition',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure class>>fieldsDesc [
" self rebuildFieldAccessors "
	^ #(
		byte one;
		long two;
		FFITestStructure nested;
		)
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure class>>initialize [
	"self rebuildFieldAccessors"
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure>>nested [
	"This method was automatically generated"
	^FFITestStructure fromHandle: (handle referenceStructAt: OFFSET_NESTED length: 28)
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure>>nested: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_NESTED put: anObject getHandle length: 28.
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure>>one [
	"This method was automatically generated"
	^handle unsignedByteAt: OFFSET_ONE
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure>>one: anObject [
	"This method was automatically generated"
	handle unsignedByteAt: OFFSET_ONE put: anObject
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure>>two [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_TWO
]

{
	#category : #'accessing structure variables',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITestNestingStructure>>two: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_TWO put: anObject
]
