"
A MCMerger is an abstract responsible for performing merge operations and detecting conflicts.
"
Class {
	#name : #MCMerger,
	#superclass : #Object,
	#category : #Monticello-Merging,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>addConflictWithOperation: anOperation [
	self operations add: anOperation beConflict
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>applyTo: anObject [
	self isMerged ifFalse: [self error: 'You must resolve all the conflicts first'].
	self operations do: [:ea | ea applyTo: anObject]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>conflicts	 [
	^ self operations select: #isConflict

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>hasConflicts [
	^ self conflicts notEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>isMerged [
	^ self conflicts allSatisfy: [:ea | ea isResolved]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>load [
	| loader |
	loader := MCPackageLoader new.
	loader provisions addAll: self provisions.
	self applyTo: loader.
	loader load
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>loadWithNameLike: baseName [
	| loader |
	loader := MCPackageLoader new.
	loader provisions addAll: self provisions.
	self applyTo: loader.
	loader loadWithNameLike: baseName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>mergedSnapshot [
	^ MCPatcher apply: self to: self baseSnapshot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>operations [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMerger>>provisions [
	^ #()
]
