"
I am the list of entries (possible symbols) returned by nocompletion algorithm.

I am sorted according to last acceptance from the user.
"
Class {
	#name : #NOCEntryList,
	#superclass : #Object,
	#instVars : [
		'size',
		'entries',
		'entryHead'
	],
	#category : #NECompletion-OCompletion,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList class>>ofSize: n  [
	^ self new setSize: n; yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>addEntry: aSymbol [
	self addEntry: aSymbol date: DateAndTime now
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>addEntry: aSymbol date: aDate [

	| entry currentEntry |
	entry := entries at: aSymbol ifAbsent: nil.
	entry 
		ifNotNil: [ entry unlink ]
		ifNil: [ 
			entry := NOCDatedEntry contents: aSymbol type: #selector.
			entries at: aSymbol put: entry ].
	entry date: aDate.
	currentEntry := entryHead previous.
	[ currentEntry == entryHead or: [
		currentEntry date <= aDate ] ] whileFalse: [
			currentEntry := currentEntry previous ].
	currentEntry link: entry.
	entries size > size ifTrue: [
		entry := entryHead next unlink.
		entries removeKey: entry contents ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>entriesMatching: prefix [
	
	^Array new: entries size // 4 + 1 streamContents: [ :stream |
		| entry |
		entry := self firstEntry.
		[ entry == entryHead ] whileFalse: [
			(entry matches: prefix) ifTrue: [ stream nextPut: entry ].
			entry := entry previous ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>first [
	^self firstEntry contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>firstEntry [
	^ entryHead previous
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>last [
	^self lastEntry contents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>lastEntry [
	^ entryHead next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>numEntries [
	^ entries size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCEntryList>>setSize: n [
	size := n.
	entries := Dictionary new: n.
	entryHead := NOCDatedEntry contents: #'' size type: #selector.
	entryHead
		next: entryHead;
		previous: entryHead.
	
	
]
