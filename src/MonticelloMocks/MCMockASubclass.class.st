"

"
Class {
	#name : #MCMockASubclass,
	#superclass : #MCMockClassA,
	#instVars : [
		'x'
	],
	#classVars : [
		'Y'
	],
	#category : #MonticelloMocks,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockASubclass class>>initialize [

	InitializationOrder := InitializationOrder
		ifNil: [ -100 ] "let the test fail"
		ifNotNil: [ InitializationOrder + 1.]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockASubclass>>variables [
	^ x + Y + MCMockClassA
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
MCMockASubclass>>variables2 [
	^ ivar + CVar
]
