"
I am a PDPackage and i represent a package (RPackageSet) and all his dependencies (PDPackageDependency).

Instance variables :

	- dependencies : a collection of PDPackageDependency (actually the nodes of a graph dependency, from a source PDPackage to a target PDPackage)
	- included : says if the PDPackage is included or not in the set of packages at the beginning.
	- rpackage : the instance of asRPackageSet 	
	- inStack : useful for tarjan algorithm and cycle algorithm. It avoid stack access
	- tarjanIndex and tarjanLowLink : integer for the tarjan algorithm.
	- bfsParent : see cycle algorithm
	- seen : says if all dependencies have been added to the Package
"
Class {
	#name : #DAPackage,
	#superclass : #Object,
	#instVars : [
		'dependencies',
		'included',
		'inStack',
		'tarjanIndex',
		'tarjanLowLink',
		'bfsParent',
		'seen',
		'rPackageSet'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 8/1/2014 14:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage class>>new [
	self shouldNotImplement
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage class>>on: aRPackageSet [
	^ self basicNew initializeWithPackage: aRPackageSet; yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage class>>onPackageNamed: aString [
	^ self on: (RPackageSet named: aString)
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>><= aPackage [
	^ (self packageName asString) <= (aPackage packageName asString)
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>= aPackage [
	(aPackage isKindOf: self class)
		ifFalse: [ ^ false ].
	^ self packageName = aPackage packageName
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>add: aDependency [
	^ dependencies add: aDependency
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>asDependentPackageWrapperOn: relationGraph [
	^ DADependentPackageWrapper newWith: self on: relationGraph
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>asPackageDependencyWrapper [
	^ DAPackageDependencyWrapper newWith: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>beIncluded [
	included := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>beSeen [
	seen := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>bfsParent [
	^ bfsParent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>bfsParent: aBfsParent [
	bfsParent := aBfsParent
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>clearDependencies [
	dependencies := OrderedCollection new
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>compositeDependencyTo: aPackage [
	^ self dependencies detect: [ :dependency | dependency target = aPackage ] ifNone: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependencies [
	^ dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependencies: anObject [
	dependencies := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependenciesFrom: aClass [
	| dependenciesFrom |
	dependenciesFrom := OrderedCollection new.
	self dependencies
		do: [ :compositeDependency | 
				dependenciesFrom addAll: (compositeDependency dependenciesFrom: aClass) ].
	^ dependenciesFrom
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependenciesSize [

	^ self dependencies 
			inject: 0
			into: [ :sum :dependency |
					sum + dependency numberOfDependencies
				]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependenciesSizeTo: aPackage [
	| dependency |
	dependency := dependencies detect: [ :each | each target packageName = aPackage packageName ].
	^ dependency ifNotNil: [ dependency numberOfDependencies ] ifNil: [ 0 ]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependenciesTo: aPackage [
	^ dependencies select: [ :each | each target packageName = aPackage ].
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependentPackages [
	^ self dependencies 
			inject: Set new 
			into: [ :dependents :each | dependents add: each target; yourself ].
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>dependentPackagesSize [
	^ dependencies size
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>displayString [
	| numberOfExtension |
	numberOfExtension := self extensionDependenciesSize.
	^ String streamContents: [ :stream | 
		stream
			nextPutAll: self packageName;
			nextPutAll: ' --> Dependent packages : ';
			nextPutAll: self dependentPackagesSize asString;
			nextPutAll: ' | Dependencies : ';
			nextPutAll: (self dependenciesSize - numberOfExtension) asString;
			nextPutAll: ' (+ ';
			nextPutAll: numberOfExtension asString;
			nextPutAll: ' extension dependencies)' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>extensionDependenciesSize [
	^ self dependencies
		inject: 0
		into: [ :sum :each | sum + each extensionDependenciesSize ]
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>extensionDependenciesSizeTo: aPackage [
	^ (self compositeDependencyTo: aPackage) extensionDependenciesSize 
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>hash [
	^ self packageName hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>inStack: aBoolean [
	inStack := aBoolean
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>included: anObject [
	included := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>initializeWithPackage: aRPackageSet [
	self initialize.
	self clearDependencies.
	rPackageSet := aRPackageSet.
	included := false.
	inStack := false.
	seen := false.
	tarjanIndex := -1.
	tarjanLowLink := -1.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>isInStack [
	^ inStack
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>isIncluded [
	^ included
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>isSeen [

	^ seen
]

{
	#category : #tarjan,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>isTarjanUndefined [
	^ tarjanIndex = -1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>packageName [
	^ self rPackageSet packageName
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>printOn: aStream [
	aStream
		nextPutAll: 'Dependencies on: ';
		nextPutAll: self packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>rPackage [
	^ self rPackageSet packages first
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>rPackageSet [
	^ rPackageSet
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>rPackageSet: anObject [
	rPackageSet := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>referenceDependenciesFrom: aClass [

	^ (self dependenciesFrom: aClass) select: [ :each | each isReferenceDependency ]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>remove: aDependency [
	^ dependencies remove: aDependency
]

{
	#category : #dependencies,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>removeAllInternal [
	dependencies := dependencies reject: [ :each | each isInternal ]
]

{
	#category : #tarjan,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>tarjanIndex [
	^ tarjanIndex 
]

{
	#category : #tarjan,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>tarjanIndex: aTarjanIndex [
	tarjanIndex := aTarjanIndex
]

{
	#category : #tarjan,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>tarjanLowLink [
	^ tarjanLowLink
]

{
	#category : #tarjan,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackage>>tarjanLowLink: aTarjanLowLink [
	tarjanLowLink := aTarjanLowLink.
]
