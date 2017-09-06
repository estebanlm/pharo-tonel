"
A class to do Tarjan Algorithm on a PDPackageRelation, in order to detect strongly connected components.
Give a package dependency graph (PDPackageRelationGraph)  in entry of the message run to run the Tarjan algorithm and retrieve all the strongly connected components graph.
"
Class {
	#name : #DATarjanAlgorithm,
	#superclass : #Object,
	#instVars : [
		'runningIndex',
		'stack',
		'stronglyConnectedComponents'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 14:44'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>initialize [
	super initialize.
	stronglyConnectedComponents := OrderedCollection new.
	stack := Stack new.
	runningIndex := 0

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>isRootNode: aPDPackage [
	^ aPDPackage tarjanLowLink = aPDPackage tarjanIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>popStackAndUpdateCurrentSCC: aRelation until: aPDPackage [
	| currentNode |	
	[ currentNode := stack pop.
	currentNode
		inStack: false;
		beIncluded.
	aRelation addPackage: currentNode ] doWhileFalse: [ currentNode = aPDPackage ].
	stronglyConnectedComponents add: aRelation
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>push: aPDPackage [
	stack push: aPDPackage.
	aPDPackage inStack: true. "use a flag to avoid stack access"
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>run: aPDPackageRelation [
	aPDPackageRelation packages
		do: [ :package | 
			package isTarjanUndefined
				ifTrue: [ self traverse: package ] ]
		displayingProgress: 'Finding SCCs'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>startNewSCC [
	^ DAPackageRelationGraph new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>stronglyConnectedComponents [
	^ stronglyConnectedComponents
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>traverse: aPDPackage [
	| aRelation |
	aPDPackage tarjanIndex: runningIndex.
	aPDPackage tarjanLowLink: runningIndex.
	runningIndex := runningIndex + 1.
	self push: aPDPackage.
	self traverseChildrenOf: aPDPackage.
	(self isRootNode: aPDPackage)
		ifTrue: [ 
			aRelation := self startNewSCC.
			self popStackAndUpdateCurrentSCC: aRelation until: aPDPackage ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DATarjanAlgorithm>>traverseChildrenOf: aPDPackage [
	aPDPackage dependencies
		do: [ :dependency | 
			dependency target isTarjanUndefined
				ifTrue: [ 
					self traverse: dependency target.
					aPDPackage tarjanLowLink: (aPDPackage tarjanLowLink min: dependency target tarjanLowLink) ]
				ifFalse: [ 
					dependency target isInStack
						ifTrue: [ aPDPackage tarjanLowLink: (aPDPackage tarjanLowLink min: dependency target tarjanIndex) ] ] ]
]
