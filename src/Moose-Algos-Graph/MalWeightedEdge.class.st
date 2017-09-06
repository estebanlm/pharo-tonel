"

"
Class {
	#name : #MalWeightedEdge,
	#superclass : #MalGraphEdge,
	#instVars : [
		'weight'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedEdge>>asTuple [

	^ {from model. to model. weight}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedEdge>>printString [

	^ self from printString, ' -> ', self to printString, ' (', self weight printString, ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedEdge>>weight [
	^ weight
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalWeightedEdge>>weight: anObject [
	weight := anObject
]
