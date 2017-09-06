"
I'm a long. 
Longs are special, see FFIULong comment for details.
"
Class {
	#name : #FFILong,
	#superclass : #FFIULong,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILong class>>externalType  [
	^ FFIArchitecture forCurrentArchitecture externalLongType
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILong>>basicHandle: aHandle at: index [
	^ aHandle platformLongAt: index
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILong>>basicHandle: aHandle at: index put: value  [
	^ aHandle platformLongAt: index put: value
]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILong>>emitSelector [
	^ 'platformLongAt'
]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFILong>>offsetPointerReadFieldAt: offsetVariableName [
	^ '^ExternalData 
		fromHandle: (handle {1}: {2})
		type: FFIArchitecture forCurrentArchitecture externalLongType asPointerType'
	format: { 
		self emitSelector.
		offsetVariableName }
]
