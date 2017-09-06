"
Other wrapper for dependent package (use in TreeModel). Useful in reverse analysis.
"
Class {
	#name : #DADependentPackageWrapper,
	#superclass : #Object,
	#instVars : [
		'pdPackage',
		'relationGraph'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 8/1/2014 14:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper class>>newWith: aPackage on: relationGraph [
	^ self new initializeFrom: aPackage on: relationGraph
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>><= other [
	^ self daPackage <= other daPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>daPackage [
	^ pdPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>daPackage: anObject [
	pdPackage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>dependenciesSize [
	| usersOf |
	usersOf := self usersOfPackage.
	^ usersOf
			 inject: 0
			 into: [ :sum :each | sum + (each dependenciesSizeTo: self daPackage) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>extensionDependenciesSize [
	| usersOf |
	usersOf := self usersOfPackage.
	^ usersOf 
			inject: 0 
			into: [ :sum :each | sum + (each extensionDependenciesSizeTo: self daPackage) ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>initializeFrom: aPackage on: aRelationGraph [
	pdPackage := aPackage.
	relationGraph :=aRelationGraph.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>packageName [
	^ self daPackage packageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>printOn: aStream [
	| numberOfExtension |
	numberOfExtension := self extensionDependenciesSize.
	aStream
		nextPutAll: self packageName;
		nextPutAll: ' <-- Users : ';
		nextPutAll: self usersOfPackageSize asString;
		nextPutAll: ' package(s) | ';
		nextPutAll: 'Dependencies : ';
		nextPutAll: ((self dependenciesSize) - numberOfExtension) asString;
		nextPutAll: ' (+ ';
		nextPutAll: numberOfExtension asString;
		nextPutAll: ' extension dependencies ';
		nextPutAll: ')'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>rPackageSet [
	^ pdPackage rPackageSet
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>relationGraph [
	^ relationGraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>relationGraph: anObject [
	relationGraph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>usersOfPackage [
	^ relationGraph usersOf: pdPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageWrapper>>usersOfPackageSize [
	^ self usersOfPackage size
]
