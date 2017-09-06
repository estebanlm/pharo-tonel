"
A diffy version
"
Class {
	#name : #MCDiffyVersion,
	#superclass : #MCVersion,
	#instVars : [
		'base',
		'patch'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/6/2014 08:08'
}

{
	#category : #'name utilities',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion class>>baseNameFrom: diffName [
	| baseId verName |
	baseId := (diffName copyAfter: $() copyUpTo: $).
	baseId ifEmpty: [^baseId].
	(baseId beginsWith: '@')
		ifTrue: [^baseId copyAfter: $@].
	verName := self verNameFrom: diffName.
	^(baseId includes: $.)
		ifTrue: [(verName copyUpToLast: $-), '-', baseId]
		ifFalse: [(verName copyUpToLast: $.), '.', baseId]

]

{
	#category : #'name utilities',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion class>>canonicalNameFor: aFileName [
	^(self nameForVer: (self verNameFrom: aFileName)
		base: (self baseNameFrom: aFileName))
			, '.', MCMcdReader extension

]

{
	#category : #'name utilities',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion class>>nameForVer: versionName base: baseName [
	| baseId |
	baseId := (versionName copyUpToLast: $.) = (baseName copyUpToLast: $.)
		ifTrue: [baseName copyAfterLast: $.]
		ifFalse: [(versionName copyUpToLast: $-) = (baseName copyUpToLast: $-)
			ifTrue: [baseName copyAfterLast: $-]
			ifFalse: ['@', baseName]].
	^ versionName, '(', baseId, ')'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion class>>package: aPackage info: aVersionInfo dependencies: aCollection baseInfo: baseVersionInfo patch: [
aPatch
	^ self basicNew initializeWithPackage: aPackage info: aVersionInfo dependencies: aCollection baseInfo: baseVersionInfo patch:
aPatch
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion class>>package: aPackage info: aVersionInfo snapshot: aSnapshot dependencies: aCollection baseVersion: aVersion [
	^ self 
		package: aPackage
		info: aVersionInfo
		dependencies: aCollection
		baseInfo: aVersion info
		patch: (aSnapshot patchRelativeToBase: aVersion snapshot)
]

{
	#category : #'name utilities',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion class>>verNameFrom: diffName [
	^diffName copyUpTo: $(
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>baseInfo [
	^ base
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>baseSnapshot [
       | baseVersion |
       baseVersion := self workingCopy repositoryGroup versionWithInfo: base.
       baseVersion ifNil: [ self error: 'Missing snapshot: ', self baseInfo name].
       ^ baseVersion snapshot
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>canOptimizeLoading [
	"Answer wether I can provide a patch for the working copy without the usual diff pass"
	^ package hasWorkingCopy
		and: [package workingCopy modified not
			and: [package workingCopy ancestors includes: self baseInfo]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>fileName [
	^ (self class nameForVer: info name base: base name), '.', self writerClass extension
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>initializeWithPackage: aPackage info: aVersionInfo dependencies: aCollection baseInfo: baseVersionInfo patch: aPatch [
	patch := aPatch.
	base := baseVersionInfo.
	super initializeWithPackage: aPackage info: aVersionInfo snapshot: nil dependencies: aCollection.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>isDiffy [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>patch [
	^ patch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>snapshot [
	^ snapshot ifNil: [snapshot := MCPatcher apply: patch to: self baseSnapshot]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>summary [
	^ '(Diff against ', self baseInfo name, ')', String cr, super summary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDiffyVersion>>writerClass [
	^ MCMcdWriter 
]
