"
A PDDependencyItemDiff is a object which represent a dependent package who added/removed from an old analysis.
"
Class {
	#name : #DADependencyItemDiff,
	#superclass : #DAAbstractItemDiff,
	#category : #Tool-DependencyAnalyser-Diff,
	#timestamp : 'BaptisteQuide 8/8/2014 10:59'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyItemDiff>>hasChanged [
	^ self 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependencyItemDiff>>printOn: aStream [
	aStream 
		nextPutAll: self content asString.
]
