"
This keeps track of the stack count for the BytecodeGenerator.
"
Class {
	#name : #IRStackCount,
	#superclass : #Object,
	#instVars : [
		'start',
		'position',
		'length'
	],
	#category : #OpalCompiler-Core-Bytecode,
	#timestamp : 'ajh 3/25/2003 00:34'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount class>>new [

	^ super new startAt: 0
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount class>>newOn: stack [

	^ self startAt: stack position
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount class>>startAt: pos [

	^ self new startAt: pos
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>= other [

	^ self class == other class 
	  and: [start = other start
	  and: [position = other position
	  and: [length = other size]]]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>hash [

	^ position hash bitXor: (length hash bitXor: start hash)
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>length [

	^length
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>linkTo: stackOrNil [

	stackOrNil ifNil: [^  self class newOn: self].
	^ self position = stackOrNil start
		ifTrue: [stackOrNil]
		ifFalse: [self error: 'stack out of sync in bytecode generator']
]

{
	#category : #affecting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>pop [

	^ self pop: 1
]

{
	#category : #affecting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>pop: n [

	(position := position - n) < 0 
		ifTrue: [self error: 'stack underflow in bytecode generator']
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>position [

	^position
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>printOn: aStream [
	
	super printOn: aStream.
	aStream
		nextPutAll: ' start '; print: start;
		nextPutAll: ' stop '; print: position;
		nextPutAll: ' max '; print: length.

]

{
	#category : #affecting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>push [
	^ self push: 1
]

{
	#category : #affecting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>push: n [
	(position := position + n) > length 
		ifTrue: [length := position]
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>size [

	^length
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>start [

	^ start
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRStackCount>>startAt: pos [

	start := position := length := pos
]
