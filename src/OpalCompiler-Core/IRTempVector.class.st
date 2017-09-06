"
I model the tempVector.

The tempvector is an array that stores all escaping variables of a block that are written to from outside.
"
Class {
	#name : #IRTempVector,
	#superclass : #IRInstruction,
	#instVars : [
		'name',
		'vars'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'MarcusDenker 8/11/2014 10:17'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>accept: aVisitor [
	^ aVisitor visitTempVector: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>indexForVarNamed: aName [
	^vars indexOf: aName

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>initialize  [
	vars := Dictionary new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>isTempVector [
	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>name: anObject [
	name := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>vars [
	^ vars
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRTempVector>>vars: anObject [
	vars := anObject.
]
