"
I am a log of system events.

Normally I enable a monitor (an EpMonitor), who adds instances of EpEvent into me.
"
Class {
	#name : #EpLog,
	#superclass : #EpAbstractLog,
	#instVars : [
		'commentByEntryReference',
		'store'
	],
	#category : #Epicea-Log,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog class>>freshFromFile: aFileReference [

	^ (self fromFile: aFileReference)
		refresh;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog class>>fromFile: aFileReference  [

	^ self newWithStore: (OmStoreFactory current fromFile: aFileReference)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog class>>new [

	^ self newWithSessionStore
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog class>>newNull [

	^ self newWithStore: OmNullStore new.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog class>>newWithSessionStore [

	^ self newWithStore: OmSessionStore new.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog class>>newWithStore: aStore  [

	^ self basicNew
		initializeWith: aStore;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>addEntryWith: anEvent tags: blockClosureForCustomTags [
	"Add an event with the specified tags"

	| newEntry |
	newEntry := OmEntry content: anEvent.

	"add tags"
	newEntry tags 
		at: self class priorReferenceKey put: self headReference;
		in: blockClosureForCustomTags.

	"write the new entry"
	store newEntry: newEntry.

	"update caches with the new entry"
	self cacheEntry: newEntry.

	self announceAdded: newEntry.

	^ newEntry
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>cacheEntry: newEntry [
	"Update caches with a new entry"

	newEntry content isEpLogEntriesComment ifTrue: [ 
		(newEntry content entryReferences) do: [ :each |
			commentByEntryReference 
				at: each
				put: newEntry content comment 
		] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>commentAt: anEntry ifAbsent: aBlock  [

	^ commentByEntryReference
		at: (self referenceTo: anEntry)
		ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>commentAt: anEntry ifPresent: aBlock  [

	^ commentByEntryReference
		at: (self referenceTo: anEntry)
		ifPresent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>entries [

	^ store entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>entriesCount [
	
	^ store entriesCount
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>entriesDo: aBlockClosure [

	^ store entriesDo: aBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>entryFor: aReference [

	^ store entryFor: aReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [
	"Answer an entry, evaluating either the first block closure if present or the second if absent."
	
	^ store 
		entryFor: aReference
		ifPresent: presentBlockClosure
		ifAbsent: absentBlockClosure
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>entryReferences [
	
	^ store entryReferences
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>firstEntryIfAbsent: absentBlock [

	^ store firstEntryIfAbsent: absentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>headReference [

	^ store headReference
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>initializeWith: aStore  [

	self initialize.
	store := aStore.
	commentByEntryReference := Dictionary new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>referenceTo: anEntry [

	^ store referenceTo: anEntry
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>refresh [
	store refresh.
	commentByEntryReference := Dictionary new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>store [

	^ store
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpLog>>updateEntriesCache [

	store entriesDo: [ :each | self cacheEntry: each ]
]
