"
A PDPackageCycle is used to represent a cycle among packages. 	
All the packages in the cycle are stored in a Collection, in the their name alphabetical order.

As soon as possible, they will be stored in the order they have been found.
"
Class {
	#name : #DAPackageCycle,
	#superclass : #Object,
	#instVars : [
		'packages'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 11:59'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle class>>new [
	^ self basicNew initialize; yourself.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>><= aPDPackageCycle [
	^ (self size) <= (aPDPackageCycle size)

]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>= aPDPackageCycle [
	(aPDPackageCycle isKindOf: self class) ifFalse: [ ^ false ]. 
	^ self size = aPDPackageCycle size and: [ self packages includesAll: aPDPackageCycle packages ].
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>> aPDPackageCycle [
	^ (self size) > (aPDPackageCycle size)

]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>addAllPackages: aCollection [
	
	aCollection do: [ :package | self addPackage: package].
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>addPackage: aPDPackage [
	packages add: aPDPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>dependentPackagesFrom: aPackage [
	"only the dependent packages from the cycle"
	^ aPackage dependentPackages select: [ :package |
		self packages includes: package
		 ]
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>displayString [
	^ String streamContents: [ :stream |
		stream
			nextPutAll: 'A cycle of ';
			print: self size;
			nextPutAll: ' packages : '.
		packages
			do: [ :package | stream nextPutAll: package packageName ]
			separatedBy: [ stream space ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>hasOutgoingDependencies: aPackage [
	^ aPackage dependencies anySatisfy: [ :dependency | (self packages includes: (dependency target)) not ].
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>hash [
	^ self packages hash.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>initialize [
	super initialize.
	packages := OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>isAtLeastInCycle: aCollectionOfPDPackage [
	^ aCollectionOfPDPackage anySatisfy: [ :package | self isInCycle: package ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>isInCycle: aPackage [
	^ packages includes: aPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>packageAt: anInteger [
	^ packages at: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>packages [
	^ packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>packages: anObject [
	packages := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>removeOutgoingDependencies [
	self packages do: [ :package | self removeOutgoingDependencies: package ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>removeOutgoingDependencies: aPackage [
	
	| removals |
	packages := packages copy.
	removals := aPackage dependencies reject: [ :dependency | self packages includes: (dependency target) ].
	
	removals do: [ :each | aPackage remove: each ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>reversedCycle [
	packages := packages reversed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageCycle>>size [
	^ packages size
]
