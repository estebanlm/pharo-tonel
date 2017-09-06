"
I model the bytecode for block returns.
"
Class {
	#name : #IRBlockReturnTop,
	#superclass : #IRReturn,
	#instVars : [
		'successor'
	],
	#category : #OpalCompiler-Core-IR-Nodes,
	#timestamp : 'MarcusDenker 8/11/2014 10:16'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBlockReturnTop>>accept: aVisitor [
	^ aVisitor visitBlockReturnTop: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBlockReturnTop>>isBlockReturnTop [

	^true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBlockReturnTop>>successor [
	^ successor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBlockReturnTop>>successor: anObject [

	successor := anObject. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBlockReturnTop>>successorSequences [
	"sent to last instruction in sequence which is expected to be a jump and return instruction"

	^  { successor }
]
