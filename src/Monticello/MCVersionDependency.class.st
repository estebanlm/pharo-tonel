"
Dependencies
"
Class {
	#name : #MCVersionDependency,
	#superclass : #Object,
	#instVars : [
		'package',
		'versionInfo'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/6/2014 08:09'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency class>>package: aPackage info: aVersionInfo [
	^ self basicNew initializeWithPackage: aPackage info: aVersionInfo
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>= other [
	^ other species = self species
		and: [other versionInfo = versionInfo
				and: [other package = package]]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>hash [
	^ versionInfo hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>initializeWithPackage: aPackage info: aVersionInfo [
	package := aPackage.
	versionInfo := aVersionInfo
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>isCurrent [
	^ package hasWorkingCopy
		and: [self isFulfilled
			and: [package workingCopy modified not]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>isFulfilled [
	^package hasWorkingCopy
		and: [self isFulfilledBy: package workingCopy ancestry]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>isFulfilledBy: anAncestry [
	^ anAncestry ancestors includes: versionInfo
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>isFulfilledByAncestors [
	^ package hasWorkingCopy
		and: [self isFulfilledByAncestorsOf: package workingCopy ancestry]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>isFulfilledByAncestorsOf: anAncestry [
	^ anAncestry hasAncestor: versionInfo
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>isOlder [
	"Answer true if I represent an older version of a package that is loaded."
	^ package hasWorkingCopy
		and: [self isFulfilled not
			and: [ self isFulfilledByAncestors
				and: [package workingCopy modified not]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>package [
	^ package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>repositoryGroup [
	^ self package workingCopy repositoryGroup
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>resolve [
	^ self repositoryGroup
		versionWithInfo: versionInfo
		ifNone: [ MCRepositoryGroup default versionWithInfo: versionInfo ifNone: []]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionDependency>>versionInfo [
	^ versionInfo
]
