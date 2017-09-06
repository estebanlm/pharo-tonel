"
Merge versions
"
Class {
	#name : #MCVersionMerger,
	#superclass : #Object,
	#instVars : [
		'records',
		'merger'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/6/2014 08:09'
}

{
	#category : #action,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger class>>mergeVersion: aVersion [
	self new
		addVersion: aVersion;
		mergeWithNameLike: aVersion info name
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>addVersion: aVersion [
	
	records add: (MCMergeRecord version: aVersion).
	aVersion dependencies 
		do: [:ea | | dep |
			dep := ea resolve.
			(records anySatisfy: [:r | r version = dep]) 
				ifFalse: [self addVersion: dep]]
		displayingProgress: [ :ea| 'Searching dependency: ', ea package name]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>addVersions: aCollection [
	aCollection do: [ :version|
		self addVersion: version].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>gatherChanges [
	records do: [:ea | merger addBaseSnapshot: ea packageSnapshot].
	records do: [:ea | merger applyPatch: ea mergePatch].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>initialize [
	super initialize.
	records := OrderedCollection new.
	merger := MCThreeWayMerger new.
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>merge [

	self gatherChanges.

	self resolveConflicts ifTrue:
		[merger load.
		records do: [:ea | ea updateWorkingCopy].
		^ true].
	
	^ false
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>mergeWithNameLike: baseName [

	self gatherChanges.
	
	self resolveConflicts ifTrue:
		[merger loadWithNameLike: baseName.
		records do: [:ea | ea updateWorkingCopy]].
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCVersionMerger>>resolveConflicts [
	(records allSatisfy: [:ea | ea isAncestorMerge]) 
		ifTrue: [
			MCNoChangesException signal. 
			^ false].
		
	^ ((MCMergeResolutionRequest new merger: merger)
			signal: 'Merging ', records first version info name) = true
]
