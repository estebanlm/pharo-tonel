"

"
Class {
	#name : #MalGraphStructure,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'nodeClass',
		'edgeClass'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : ''
}

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphStructure>>edgeClass [

	^ edgeClass
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphStructure>>edgeClass: anObject [
	edgeClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphStructure>>edgeModels [

	^ self edges collect: [:e | e model]
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphStructure>>nodeClass [

	^ nodeClass
]

{
	#category : #configuration,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphStructure>>nodeClass: anObject [
	nodeClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalGraphStructure>>nodeModels [

	^ self nodes collect: [:n | n model]
]
