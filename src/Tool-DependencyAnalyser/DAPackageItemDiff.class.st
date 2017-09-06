"
A PDAbstractItemDiff is a object which represent a package who added/modified/removed from an old analysis.
"
Class {
	#name : #DAPackageItemDiff,
	#superclass : #DAAbstractItemDiff,
	#category : #Tool-DependencyAnalyser-Diff,
	#timestamp : 'BaptisteQuide 8/7/2014 12:09'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageItemDiff>>dependencies [
	 ^ self content dependentPackages 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageItemDiff>>hasChanged [
	^ diff dependentPackagesDiff
		detect: [ :each | each parent = self content and: [ each hasChanged ] ]
		ifFound: [ true ]
		ifNone: [ false ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageItemDiff>>printOn: aStream [
	aStream 
		nextPutAll: content packageName.
]
