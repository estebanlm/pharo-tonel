"
A record for merging
"
Class {
	#name : #MCMergeRecord,
	#superclass : #Object,
	#instVars : [
		'version',
		'packageSnapshot',
		'ancestorInfo',
		'ancestorSnapshot',
		'imagePatch',
		'mergePatch'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/5/2014 13:49'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord class>>version: aVersion [
	^ self basicNew initializeWithVersion: aVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>ancestorInfo [
	^ ancestorInfo ifNil: [ancestorInfo := version info commonAncestorWith: version workingCopy ancestry]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>ancestorSnapshot [
	^ ancestorSnapshot ifNil: [ancestorSnapshot := version workingCopy findSnapshotWithVersionInfo: self ancestorInfo]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>imageIsClean [
	| ancestors |
	ancestors := version workingCopy ancestors.
	^ ancestors size = 1
		and: [(ancestors first = self ancestorInfo)
				and: [self imagePatch isEmpty]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>imagePatch [
	^ imagePatch ifNil: [imagePatch := self packageSnapshot patchRelativeToBase: self ancestorSnapshot]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>initializeWithVersion: aVersion [
	version := aVersion
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>isAncestorMerge [
	^ version workingCopy ancestry hasAncestor: version info
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>mergePatch [
	^ mergePatch ifNil: [mergePatch := version snapshot patchRelativeToBase: self ancestorSnapshot]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>packageSnapshot [
	^ packageSnapshot ifNil: [packageSnapshot := version package snapshot]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>updateWorkingCopy [
	self isAncestorMerge ifFalse:
		[self imageIsClean
			ifTrue: [version workingCopy loaded: version]
			ifFalse: [version workingCopy merged: version]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMergeRecord>>version [
	^ version
]
