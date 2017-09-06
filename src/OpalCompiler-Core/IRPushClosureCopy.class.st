"
Instruction push closure copy bytecode

I am modelled as a Jump as the bytecode of the block is inlined into the method, with the execution jumping over these embedded bytecodes. 


"
Class {
	#name : #IRPushClosureCopy,
	#superclass : #IRJump,
	#instVars : [
		'numArgs',
		'blockSequence',
		'tempMap',
		'copiedValues',
		'lastBlockSequence',
		'arguments'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'MarcusDenker 8/11/2014 10:15'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>accept: aVisitor [
	^ aVisitor visitPushClosureCopy: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>arguments [
	^arguments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>arguments: anArray [
	arguments := anArray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>blockHasTempVector: aSymbol [
	^ blockSequence hasTempVector: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>blockSequence  [
^blockSequence
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>blockSequence: anIRSequence  [
	blockSequence := anIRSequence
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>copiedValues [
	^ copiedValues
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>copiedValues: anArray  [
	copiedValues := anArray.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>definedTemps [

	^self tempMap keys copyWithoutAll: (arguments, copiedValues).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>hasTempVector: aSymbol [
	^ (blockSequence hasTempVector: aSymbol) or:[sequence hasTempVector: aSymbol]
]

{
	#category : #scoping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>indexForVarNamed: aName [

	^tempMap at: aName
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>initialize [
	super initialize.
	tempMap := Dictionary new.
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>isGoto [
	^ 	false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>isJump [
	^ 	false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>isPushClosureCopy [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>lastBlockSequence  [
	^lastBlockSequence
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>lastBlockSequence: aSequence [
	lastBlockSequence := aSequence
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>nonBodySuccessorSequences [

	^ {destination}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>numArgs [
	^numArgs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>numArgs: aSmallInteger  [
	numArgs := aSmallInteger
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>sequenceHasTempVector: aSymbol [
	^ sequence hasTempVector: aSymbol
]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>sourceNodeExecuted [
	^self sourceNode parent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>successorSequences [

	^ {destination. blockSequence} 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>tempKeys [
	^tempMap keys 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>tempMap [
	^tempMap
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>tempVectorName [
	self blockSequence do:[:irNode | irNode isTempVector ifTrue:[^irNode name]].
	^nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushClosureCopy>>tempVectorNamed: aName [
    (self blockHasTempVector: aName)
        ifTrue: [ ^ blockSequence tempVectorNamed: aName ].
    (self sequenceHasTempVector: aName)
                ifTrue: [ ^ sequence tempVectorNamed: aName ].
    ^ nil
]
