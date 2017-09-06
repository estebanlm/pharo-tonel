"
A PDDependentPackageItemDiff is a object which represent a dependent package who added/modified/removed from an old analysis.
"
Class {
	#name : #DADependentPackageItemDiff,
	#superclass : #DAAbstractItemDiff,
	#instVars : [
		'parent'
	],
	#category : #Tool-DependencyAnalyser-Diff,
	#timestamp : 'BaptisteQuide 8/7/2014 12:15'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageItemDiff>>hasChanged [
	^ self isNew or: [ self isRemoved ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageItemDiff>>parent [
	^ parent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageItemDiff>>parent: anObject [
	parent := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DADependentPackageItemDiff>>printOn: aStream  [
	aStream 
		nextPutAll: content packageName;
		nextPutAll: ' Parent : ';
		nextPutAll: self parent packageName
]
