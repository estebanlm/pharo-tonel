"
I represent a loop in the bytecode.

My instances represent an unconditional loop. These loops can't fall through the code right after as it's infinite, however, it can finish if there is a return inside.

Conditional loops are instances of my subclass.

backjump <Smi> pc of the backjump instruction
"
Class {
	#name : #FBDLoop,
	#superclass : #Object,
	#instVars : [
		'backjump'
	],
	#category : #Flashback-Decompiler,
	#timestamp : 'ClementBera 6/19/2015 15:11'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDLoop>>backjump [
	^ backjump
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDLoop>>backjump: anObject [
	backjump := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDLoop>>isConditionalLoop [
	^ false
]
