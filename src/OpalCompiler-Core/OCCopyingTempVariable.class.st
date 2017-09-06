"
A copying temp is a temp that is copied into a block that later reads this variable.

Not: the temp vector is passed as a copying temp, too.
"
Class {
	#name : #OCCopyingTempVariable,
	#superclass : #OCTempVariable,
	#instVars : [
		'originalVar'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 8/11/2014 10:20'
}

{
	#category : #'temp vector',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCCopyingTempVariable>>indexFromIR [

	^ scope node irInstruction indexForVarNamed: name
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCCopyingTempVariable>>indexInTempVectorFromIR: aName [
	^(scope methodScope node irInstruction tempVectorNamed: name) indexForVarNamed: aName.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCCopyingTempVariable>>isCopying [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCCopyingTempVariable>>originalVar [
	^ originalVar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCCopyingTempVariable>>originalVar: anObject [
	originalVar := anObject
]

{
	#category : #'temp vector',
	#timestamp : ' 8/31/2017 07:16:23'
}
OCCopyingTempVariable>>tempVectorForTempStoringIt [
	"If I am stroring a temp Vector, this method returns this victor.
	useful for analysis e.g. which variables are active in a context"
	
	| searchScope |
	self isStoringTempVector ifFalse: [^nil].
	searchScope := scope.
	
	[searchScope isInstanceScope or: [searchScope tempVectorName = name]] 
		whileFalse: [searchScope := searchScope outerScope].
	searchScope isInstanceScope 
		ifTrue: [ ^nil] "not found"
		ifFalse: [^ searchScope tempVector]
	
]
