"
I keep the state of the ocompletion algorithm. 
See comments of my parents for details. 
"
Class {
	#name : #NOCModel,
	#superclass : #NECUntypedModel,
	#instVars : [
		'table',
		'expand',
		'context',
		'nextModel',
		'classTable'
	],
	#category : #NECompletion-OCompletion,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>addEntry: ent [
	(self tableForEntry: ent) addEntry: ent 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>addSelectors [
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>at: aNumber [
	
	^ self entries at: (aNumber max: 1) 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>completionAt: aNumber [
	"when an entry is selected, update its date (for inlined messages which do not appear in the method's body"
	| entry |
	
	entry := (self at: aNumber) completion.
	self addEntry: entry.
	
	^ NECPreferences spaceAfterCompletion 
		ifTrue: [ entry separateKeywords, ' ' ]
		ifFalse: [ entry separateKeywords ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>context: aNOCContext [
	context := aNOCContext.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>contract [
	expand := true.
	nextModel := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>entries [
	entries ifEmpty: [ self loadEntries ].
	^  entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>entryCount [
	^ self entries size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>expand [
	expand := true.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>initialize [
	super initialize.
	self contract.
	table := NOCCompletionTable default.
	classTable := NOCCompletionTable classes.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>initializeSelectors [

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>loadEntries [
	| priorityEntries  |
	"entries used from the last recently used"
	priorityEntries := 6.
	self loadNextModelEntries.
	
	entries size <= priorityEntries
		ifTrue: [ ^ self ].
		
	"most recently used entries first!"
	self sortByLastRecentlyUsed: self loadFavoredEntries.
		
	"sort the rest alphabetically"
	entries 
		mergeSortFrom: priorityEntries
		to: entries size 
		by: [ :a :b| 
			(a contents asString compare: b contents asString caseSensitive: false) <= 2 ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>loadFavoredEntries [
	
	(narrowString notEmpty and: [narrowString first isUppercase]) 
			ifTrue: [ ^ classTable entriesMatching: narrowString ].
					
	includeSelectors 
		ifTrue: [ ^ table entriesMatching: narrowString ]
		ifFalse: [ ^ #() ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>loadNextModelEntries [
	entries := self nextModel entries 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>narrowWith: aString [
	self narrowString: aString.
	self loadEntries.
	self nextModel ifNotNil: [:nm | nm narrowWith: aString].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>nextModel [
	^ nextModel ifNil: [
		nextModel := context nextModel. 
		nextModel narrowWith: narrowString.
		nextModel ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>noNextModel [
	nextModel := NOCEmptyModel new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>sortByLastRecentlyUsed: lastRecentlyUsedEntries [
	"Sort my entrys by the most recently used date"
	| lastRecentlyUsed |
	
	lastRecentlyUsed := Dictionary new.
	
	lastRecentlyUsedEntries do: [ :entry|
		lastRecentlyUsed at: entry contents put: entry date asSeconds ].
	
	entries sort: [ :a :b|| dateA dateB|
		dateA := lastRecentlyUsed at: a contents asString ifAbsent: [ 0 ].
		dateB := lastRecentlyUsed at: b contents asString ifAbsent: [ 0 ].
		dateA >= dateB].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>table [
	^ table
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>tableForEntry: ent [
	^ (ent notEmpty and: [ent first isUppercase]) 
			ifTrue: [classTable]
			ifFalse: [table]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>title [
	^ self nextModel title
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCModel>>useUniqueTable [
	table := NOCCompletionTable new entriesPerPrefix: 20.
	
]
