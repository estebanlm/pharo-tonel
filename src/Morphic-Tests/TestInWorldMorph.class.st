"
Helper class for MorphTest
"
Class {
	#name : #TestInWorldMorph,
	#superclass : #Morph,
	#instVars : [
		'intoWorldCount',
		'outOfWorldCount'
	],
	#category : #Morphic-Tests-Kernel,
	#timestamp : 'sd 6/5/2005 10:25'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:43'
}
TestInWorldMorph>>initialize [
	super initialize.
	outOfWorldCount := intoWorldCount := 0.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
TestInWorldMorph>>intoWorld: aWorld [
	aWorld ifNil:[^self].
	super intoWorld: aWorld.
	intoWorldCount := intoWorldCount + 1.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
TestInWorldMorph>>intoWorldCount [
	^intoWorldCount
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
TestInWorldMorph>>outOfWorld: aWorld [
	aWorld ifNil:[^self].
	super outOfWorld: aWorld.
	outOfWorldCount := outOfWorldCount + 1.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
TestInWorldMorph>>outOfWorldCount [
	^outOfWorldCount
]
