"
Sort filtered versions 
"
Class {
	#name : #MCFilteredVersionSorter,
	#superclass : #MCVersionSorter,
	#instVars : [
		'target'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/6/2014 08:10'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFilteredVersionSorter>>addVersionInfo: aVersionInfo [
	(aVersionInfo hasAncestor: target)
		ifTrue: [super addVersionInfo: aVersionInfo]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFilteredVersionSorter>>processVersionInfo: aVersionInfo [
	| success |
	aVersionInfo = target ifTrue: [^ true].
	(aVersionInfo hasAncestor: target) ifFalse: [^false].
	self pushLayer.
	success := (self knownAncestorsOf: aVersionInfo) anySatisfy:
				[:ea | self processVersionInfo: ea].
	self popLayer.
	success ifTrue: [self addToCurrentLayer: aVersionInfo].
	^ success	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCFilteredVersionSorter>>target: aVersionInfo [
	target := aVersionInfo
]
