"
A utility class to easily get circuits, i.e. SCC with more than one node.
"
Class {
	#name : #MalSccExtractor,
	#superclass : #MalGraphAlgorithm,
	#instVars : [
		'circuits'
	],
	#category : #Moose-Algos-Graph,
	#timestamp : 'ChristopheDemarey 3/23/2015 15:27'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccExtractor>>addCircuit: aCollectionOfNodes [
	
	circuits add: aCollectionOfNodes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccExtractor>>circuits [
	^ circuits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccExtractor>>initialize  [

	super initialize.
	circuits := Set new.

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
MalSccExtractor>>run [

	self subclassResponsibility
]
