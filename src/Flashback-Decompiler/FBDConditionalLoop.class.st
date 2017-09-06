"
I represent a conditional loop (typically, a for or while loop). In addition to my superclass I hold the pc of the conditional jump that exits the loop body.

exitCondition <Smi> pc of the conditional jump where the execution flows exits the loop body.
"
Class {
	#name : #FBDConditionalLoop,
	#superclass : #FBDLoop,
	#instVars : [
		'exitCondition'
	],
	#category : #Flashback-Decompiler,
	#timestamp : 'ClementBera 6/19/2015 14:50'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDConditionalLoop>>exitCondition [
	^ exitCondition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDConditionalLoop>>exitCondition: anObject [
	exitCondition := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
FBDConditionalLoop>>isConditionalLoop [
	^ true
]
