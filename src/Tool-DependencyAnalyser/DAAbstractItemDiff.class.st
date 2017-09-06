"
A PDAbstractItemDiff is a object which represent an item who added/modified/removed from an old analysis.
"
Class {
	#name : #DAAbstractItemDiff,
	#superclass : #Object,
	#instVars : [
		'new',
		'underteminate',
		'content',
		'diff',
		'removed'
	],
	#category : #Tool-DependencyAnalyser-Diff,
	#timestamp : 'BaptisteQuide 8/7/2014 12:08'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff class>>newWith: aContent [
	^ (self new)
		content: aContent;
		yourself
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>beNew [
	new := true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>beRemoved [
	removed := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>beUnderteminate [
	underteminate := true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>canBeDisplay [
	^ (self isNew or: [ self isRemoved ]) or: [ self hasChanged ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>content [
	 ^ content
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>content: aContent [
	content := aContent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>diff [
	^ diff
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>diff: anObject [
	diff := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>hasChanged [
	self subclassResponsibility 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>initialize [
	new := false.
	removed := false.
	underteminate := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>isNew [
	^ new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>isRemoved [
	^ removed
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>isUnderteminate [
	 ^ underteminate 
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DAAbstractItemDiff>>printOn: aStream [
	self subclassResponsibility 
]
