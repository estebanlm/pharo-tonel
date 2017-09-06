"
I model the pushArray bytecode.

Used for setting up the temp vectors and for the brace array construct: { }.
"
Class {
	#name : #IRPushArray,
	#superclass : #IRInstruction,
	#instVars : [
		'size',
		'cons'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'MarcusDenker 8/11/2014 10:16'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushArray>>accept: aVisitor [
	^ aVisitor visitPushArray: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushArray>>cons [
	^ cons
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushArray>>cons: aBool [
	cons := aBool.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushArray>>initialize [
	size := 0.
	cons := false.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushArray>>size  [
	^ size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRPushArray>>size: aSmallInteger  [
	size := aSmallInteger
]
