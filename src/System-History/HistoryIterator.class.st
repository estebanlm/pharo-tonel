"
A HistoryIterator holds an UndoRedoGroup in order to store an history of commands with the possibility of undoing and redoing. The iterator cursor is represented by the index inst var. Index always contains the position of the command that can be currently undone. So, undo decrease index and redo increase index. When a new record is stored, then, index contains the newly added record position.
See HistoryIteratorTest for examples.

Instance Variables
	index:		<Integer>
	maxSize:		<Integer>
	plugged:		<Boolean>
	recorder:		<UndoRedoGroup>

index
	- the iterator cursor

maxSize
	- the maximum number of records that can be added in the root group.

plugged
	- if false, then adding of command is not allowed. Useful to prevent bad history recording recurssions (record while undoing or redoing).

recorder
	- The root of the history tree which records undo/redo commands

"
Class {
	#name : #HistoryIterator,
	#superclass : #Object,
	#instVars : [
		'index',
		'plugged',
		'recorder',
		'maxSize'
	],
	#category : #System-History,
	#timestamp : 'AlainPlantec 12/14/2010 23:40'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>addItem: anHistoryItem [
	| result |
	self isPlugged ifFalse: [^ false].
	self recorder removeLast: (self size - self index).
	result := self recorder addItem: anHistoryItem.
	self updateIndex.
	^ result
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>addRecord: anItem [
	^ self addItem: anItem

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>at: anInteger [
	^ self recorder at: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>at: anInteger put: anItem [
	self recorder at: anInteger put: anItem
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>closeGroup [
	self recorder closeGroup

]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>closeRecordGroup [
	^ self closeGroup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>current [
	^ (self index <= self size and: [self index > 0])
		ifTrue: [self recorder at: self index]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>defaultMaximumSize [
	"unlimited by default"
	^ 999999999
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>do [
	^ self redo
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>doAndAddRecord: anUndoRedoRecord [
	| result |
	result := anUndoRedoRecord do.
	self addItem: anUndoRedoRecord.
	^ result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>first [
	^ self recorder first
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>groupFrom: firstIdx to: secondIdx [
	| group |
	group := UndoRedoGroup new.
	firstIdx to: (secondIdx min: index) do: [:i | group addItem: (self at:i)].
	group close.
	group 
		isEmpty ifTrue: [^ self].
	firstIdx + 1 to: (secondIdx min: index) do: [:i | self removeAt: i].
	self at: firstIdx put: group.
	index := index - group size + 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>hasNext [
	"is there an item after current index"
	^ self recorder size - self index > 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>hasPrevious [
	"is there an item before current index"
	^ self index > 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>index [
	^ index ifNil: [index := self size]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>isPlugged [
	^ plugged ifNil: [plugged := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>last [
	^ self recorder last
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>maxSize [
	^ maxSize ifNil: [maxSize := self defaultMaximumSize]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>maxSize: anInteger [
	maxSize := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>next [
	"next item in history"
	^ self hasNext
		ifTrue: [ index := self index + 1.
			self current]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>nextList [
	"return 'next' items sublist "
	^ self recorder copyFrom: self index + 1 to: self size
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>openGroup [
	self recorder openGroup.
	self updateIndex.

]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>openRecordGroup [
	^ self openGroup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>previous [
	"previous item in history"
	^ self hasPrevious
		ifTrue: [index := self index - 1.
			self current]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>previousList [
	"return 'prev' items sublist"
	^ self recorder copyFrom: 1 to: self index - 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>recorder [
	^ recorder ifNil: [recorder := UndoRedoGroup new]
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>redo [
	self unplugWhile: [
		self hasNext ifFalse: [^false].
		self next redo].
	^ true
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>redo: doMessageSend undo: undoMessageSend [
	self addItem: (UndoRedoRecord redo: doMessageSend undo: undoMessageSend)
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>redoArray: doArray undoArray: undoArray [
	self addItem: (UndoRedoRecord redoArray: doArray undoArray: undoArray)
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>removeAt: anIndex [
	self recorder removeAt: anIndex
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>removeFirst [
	self recorder removeFirst
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>reset [
	self recorder reset.
	index := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>size [
	^ self recorder size
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>undo [
	self unplugWhile: [
		self current ifNotNil: [:curr | curr undo].
		self previous].
	^ true
]

{
	#category : #undo-undo,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>unplugWhile: aBlock [
	| wasPlugged |
	wasPlugged := self isPlugged.
	plugged := false.
	aBlock ensure: [ plugged := wasPlugged ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:16'
}
HistoryIterator>>updateIndex [
	self size <= self maxSize
		ifFalse: [self removeFirst].
	index := self size.

]
