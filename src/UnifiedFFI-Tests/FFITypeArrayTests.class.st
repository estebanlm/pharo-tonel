"

"
Class {
	#name : #FFITypeArrayTests,
	#superclass : #TestCase,
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayTests>>testAt [
	| externalArray |
	
	externalArray := (FFITypeArray ofType: 'int' size: 10) new.
	self assert: externalArray size equals: 10.
	1 to: 10 do: [ :index | self assert: (externalArray at: index) equals: 0 ]

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayTests>>testAtPut [
	| externalArray |
	
	externalArray := (FFITypeArray ofType: 'int' size: 1) new.
	externalArray at: 1 put: 42.
	self assert: (externalArray at: 1) equals: 42
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayTests>>testExternalAt [
	| externalArray |
	
	[
	 	externalArray := (FFITypeArray ofType: 'int' size: 10) externalNew.
		self assert: externalArray size equals: 10.
		"External is not initialized, so I cannot check for contents unless I assign them"
		1 to: 10 do: [ :index | externalArray at: index put: 0 ].
		"Testing accessing"
		1 to: 10 do: [ :index | self assert: (externalArray at: index) equals: 0 ].
	] ensure: [ 
		externalArray free ] 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayTests>>testExternalAtPut [
	| externalArray |
	
	[	
		externalArray := (FFITypeArray ofType: 'int' size: 1) externalNew.
		externalArray at: 1 put: 42.
		self assert: (externalArray at: 1) equals: 42 ]
	ensure: [ 
		externalArray free ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayTests>>testExternalAtPutFloat [
	| random array |
	random := Random new.
	[
		array := (FFITypeArray ofType: 'float' size: 10) externalNew.
		1 to: 10 do: [ :index | array at: index put: random next ].
		1 to: 10 do: [ :index | self assert: (array at: index) isFloat ] ]
	ensure: [ array free ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayTests>>testStructureRead [
	| structure |
	
	structure := FFITestArrayStructure new.
	
]
