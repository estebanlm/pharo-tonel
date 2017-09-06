"
IRClosureStackCount is used to distinguish between a stack 
in the method scope and a stack within a closure block. The
closure stack size is independent of the number of tempvars from the compiled method, therefore that number is subtracted
from this stack size length.
"
Class {
	#name : #IRClosureStackCount,
	#superclass : #IRStackCount,
	#instVars : [
		'numMethodTempVars'
	],
	#category : #OpalCompiler-Core-Bytecode,
	#timestamp : 'NicolaiHess 11/17/2015 23:57'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:23'
}
IRClosureStackCount class>>newOn: stack [
	^ (self startAt: stack position)
		numMethodTempVars: stack numMethodTempVars;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRClosureStackCount>>initialize [

	super initialize.

	numMethodTempVars := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRClosureStackCount>>length [

	^ super length - self numMethodTempVars
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRClosureStackCount>>numMethodTempVars [
	^ numMethodTempVars
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRClosureStackCount>>numMethodTempVars: nilOrNumber [
	numMethodTempVars := nilOrNumber ifNil:[0]
]
