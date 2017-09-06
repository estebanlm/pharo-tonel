"
BFS (see http://en.wikipedia.org/wiki/Breadth-first_search)  iterator for an MTProject graph.
We avoid to visit already visited children of a node.
"
Class {
	#name : #MTProjectBFSIterator,
	#superclass : #Object,
	#instVars : [
		'project',
		'queue',
		'alreadyVisited'
	],
	#category : #Versionner-Core-DependenciesModel,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator class>>on: anMTProject [
	^ self new
		project: anMTProject;
		yourself.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>hasChildNodes: aNode [
	| dependencies |
	
	[ dependencies := aNode dependencies ] 
		on: MessageNotUnderstood 
		do: [  ^false ].
	^ dependencies size > 0
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>hasNext [
	^ queue isEmpty not
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>initialize [
	queue := SharedQueue new.
	alreadyVisited := Set new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>isNotVisited: aNode [
	^ (alreadyVisited includes: aNode) not
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>next [
	| currentElement |
	
	currentElement := queue nextOrNil.
	currentElement ifNotNil: [
		((self hasChildNodes: currentElement) and: [ self isNotVisited: currentElement ])
			ifTrue: [ queue nextPutAll: currentElement dependencies.
					 alreadyVisited add: currentElement ] ].
	^ currentElement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>project: anMTProject [
	project := anMTProject.
	self reset
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTProjectBFSIterator>>reset [
	self initialize.
	queue nextPut: project
]
