"
A PDPackageRelationGraphDiff do the diff between two PDPackageRelationGraph (an older and a newer) to detect :

 - which packages added/removed : packagesDiff.
 - which dependent packages added/removed from a package : dependentPackagesDiff.
 - which dependencies added/removed from a dependent package.
"
Class {
	#name : #DAPackageRelationGraphDiff,
	#superclass : #Object,
	#instVars : [
		'oldRelationGraph',
		'newRelationGraph',
		'packagesDiff',
		'dependentPackagesDiff'
	],
	#category : #Tool-DependencyAnalyser-Diff,
	#timestamp : 'BaptisteQuide 8/7/2014 15:09'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff class>>loadFrom: aSerializeFile  [
	^ self new
		oldRelationGraph: (FLMaterializer materializationFromFileNamed: aSerializeFile).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff class>>loadFrom: aSerializeFile with: newRelationGraph [
	^ self new
		oldRelationGraph: (FLMaterializer materializationFromFileNamed: aSerializeFile);
		newRelationGraph: newRelationGraph
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>addNewDependentPackage: package from: parent [
	^ dependentPackagesDiff
		add:
			((DADependentPackageItemDiff
				newWith: package)
				beNew;
				parent: parent;
				diff: self);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>addNewPackage: seenPackage [
	^ packagesDiff
		add:
			((DAPackageItemDiff newWith: seenPackage)
				beNew;
				diff: self);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>addRemovedDependentPackage: package from: parent [
	^ dependentPackagesDiff
		add:
			((DADependentPackageItemDiff
				newWith: package)
				beRemoved;
				parent: parent;
				diff: self);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>addRemovedPackage: seenPackage [
	^ packagesDiff
		add:
			((DAPackageItemDiff newWith: seenPackage)
				beRemoved;
				diff: self);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>addUndeterminateDependentPackage: aPackage from: parent [
	^ dependentPackagesDiff
		add:
				((DADependentPackageItemDiff newWith: aPackage)
						beUnderteminate;
						parent: parent;
						diff: self);
		yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>addUndeterminatePackage: aPackage [
	^ packagesDiff
		add:
			((DAPackageItemDiff newWith: aPackage)
				beUnderteminate;
				diff: self);
				yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>dependentPackagesDiff [
	^ dependentPackagesDiff
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>dependentPackagesDiffNew [
	^ dependentPackagesDiff select: [ :each | each isNew ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>dependentPackagesDiffRemoved [
	^ dependentPackagesDiff select: [ :each | each isRemoved ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>dependentPackagesDiffUnderteminate [
	^ dependentPackagesDiff select: [ :each | each isUnderteminate ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>initialize [
	packagesDiff := OrderedCollection new.
	dependentPackagesDiff := OrderedCollection new.
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>lookUpForNewDependentPackages: newDependentPackages with: oldDependentPackages from: aPackage [
	
	| newDependent |
	newDependent := newDependentPackages reject: [ :package | oldDependentPackages includes: package ].
	newDependent do: [ :each | self addNewDependentPackage: each from: aPackage ].
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>lookUpForNewPackages [
			
	| newPackages |
	newPackages := newRelationGraph seenPackages reject: [ :package | oldRelationGraph includesSeenPackage: package ].
	newPackages do: [ :each | self addNewPackage: each ].
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>lookUpForRemovedDependentPackages: oldDependentPackages with: newDependentPackages from: aPackage [

	| removed |
	removed := oldDependentPackages reject: [ :package | newDependentPackages includes: package ].
	removed do: [ :each | self addRemovedDependentPackage: each from: aPackage ].
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>lookUpForRemovedPackages [
	| old |
	old := oldRelationGraph seenPackages reject: [ :each |  newRelationGraph includesSeenPackage: each ].	
	old do: [ :each |
		self addRemovedPackage: each
		 ]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>lookUpForUndeterminateDependentPackagesFrom: parent [
	| oldDependentPackages undeterminates |
	oldDependentPackages := (oldRelationGraph packageAt: parent packageName) dependentPackages.
	undeterminates := oldDependentPackages reject: [ :package | self removedDependentPackagesIncludes: package from: parent ].
	
	
	undeterminates do: [ :each | self addUndeterminateDependentPackage: each from: parent ].

]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>lookUpForUndeterminatePackages [
	| undeterminates |
	undeterminates := oldRelationGraph seenPackages reject: [ :package | self removedPackagesIncludes: package ].
	undeterminates do: [ :each | self addUndeterminatePackage: each ]
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>make [
	self 
		makePackagesDiff;	
		makeDependentPackagesDiff
		
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>makeDependenciesDiff [

]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>makeDependentPackagesDiff [
	"we're just looking at the package undeterminate"
	"every dependent packages are removed or new in older or new packages"
	self packagesDiffUnderteminate do: [ :item |
			self makeDependentPackagesDiffOn: item content.
		 ]
	
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>makeDependentPackagesDiffOn: aPackage [
	
	| oldDependentPackages newDependentPackages  |
	
	oldDependentPackages := (oldRelationGraph packageAt: aPackage packageName) dependentPackages.
	newDependentPackages := (newRelationGraph packageAt: aPackage packageName) dependentPackages.
	
	self lookUpForRemovedDependentPackages: oldDependentPackages with: newDependentPackages from: aPackage.
	self lookUpForNewDependentPackages: newDependentPackages with: oldDependentPackages from: aPackage.
	self lookUpForUndeterminateDependentPackagesFrom: aPackage.
]

{
	#category : #searching,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>makePackagesDiff [
	"lookUp for new and remove packages"

	self
		lookUpForRemovedPackages;
		lookUpForNewPackages;
		 lookUpForUndeterminatePackages.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>newRelationGraph [
	^ newRelationGraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>newRelationGraph: anObject [
	newRelationGraph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>oldRelationGraph [
	^ oldRelationGraph
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>oldRelationGraph: anObject [
	oldRelationGraph := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packageDiffNamed: aName [
	^ self packagesDiff detect: [ :item | item content packageName = aName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiff [
	^ packagesDiff
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffNew [
	^ packagesDiff select: [ :each | each isNew ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffNewSize [
	^ self packagesDiffNew size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffRemoved [
	^ packagesDiff select: [ :each | each isRemoved ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffRemovedSize [
	^ self packagesDiffRemoved size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffToDisplay [
	^ packagesDiff select: [ :each | each canBeDisplay ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffUnderteminate [
	^ packagesDiff select: [ :each | each isUnderteminate  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>packagesDiffUnderteminateSize [
	^ self packagesDiffUnderteminate size
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>removedDependentPackagesIncludes: aPackage from: parent [
	^ self dependentPackagesDiffRemoved
		detect: [ :package | package content = aPackage and: [ package parent = parent ] ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageRelationGraphDiff>>removedPackagesIncludes: seenPackage [

	^ self packagesDiffRemoved detect: [ :each | each content = seenPackage ]
			ifFound: [ true ]
			ifNone: [ false ]

]
