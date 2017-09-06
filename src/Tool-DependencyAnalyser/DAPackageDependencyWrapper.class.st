"
Wrapper for dependent package (use in TreeModel)
"
Class {
	#name : #DAPackageDependencyWrapper,
	#superclass : #Object,
	#instVars : [
		'daPackage'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper class>>newWith: aPackage [
	^ self new initializeFrom: aPackage
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>><= other [
	^ self daPackage <= other daPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>>daPackage [
	^ daPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>>daPackage: anObject [
	daPackage := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>>initializeFrom: aPackage [
	super initialize.
	self daPackage: aPackage.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>>packageName [
	^ daPackage packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>>printOn: aStream [
	aStream nextPutAll: self packageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAPackageDependencyWrapper>>rPackageSet [
	^ daPackage rPackageSet
]
