"
I am an abstract test case for Ombu stores. My subclasses implement a hook to answer new concrete stores.
"
Class {
	#name : #OmStoreTest,
	#superclass : #TestCase,
	#instVars : [
		'store',
		'anEntry',
		'aReference',
		'otherStore'
	],
	#category : #OmbuTests,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest class>>isAbstract [
	^ self name = #OmStoreTest
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>beforeAndAfterFlushStore: aBlock  [

	aBlock value.
	store flush. "Reason: It's worth testing again, after flush."
	aBlock value.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>setUp [
	super setUp.
	
	store := self setUpStore.
	otherStore := self setUpOtherStore.
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>setUpOtherStore [
	^ self setUpStore
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>setUpStore [
	^ self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>tearDown [
	super tearDown.
	
	store flush.
	otherStore flush.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntries [
	self assert: store entries isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntriesCount [
	self assert: store entriesCount equals: 0.
	
	store newEntry: (OmEntry content: 42).
	store newEntry: (OmEntry content: 43).
	
	self beforeAndAfterFlushStore: [
		self assert: store entriesCount equals: 2 ].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntriesDo [
	1 to: 7 do: [ :each | store newEntry: (OmEntry content: each) ].

	self beforeAndAfterFlushStore: [
		| contents |
		contents := Array streamContents: [ :stream | 
			store entriesDo: [ :entry | stream nextPut: entry content ] ].

		self assert: contents equals: (1 to: 7) asArray ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntryForAbsentEntry [
	| isPresent isAbsent |
	anEntry := OmEntry content: 42.
	
	store newEntry: anEntry.

	self beforeAndAfterFlushStore: [
		isPresent := false.
		isAbsent := false.	

		otherStore 
			entryFor: (store referenceTo: anEntry)
			ifPresent: [ :e | isPresent := true ] 
			ifAbsent: [ isAbsent := true ].

		self deny: isPresent.
		self assert: isAbsent ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntryForNullReference [
	| isPresent isAbsent |

	self beforeAndAfterFlushStore: [
		isPresent := false.
		isAbsent := false.	

		otherStore 
			entryFor: OmNullReference uniqueInstance
			ifPresent: [ :e | isPresent := true ] 
			ifAbsent: [ isAbsent := true ].

		self deny: isPresent.
		self assert: isAbsent ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntryForPresentEntry [
	| isPresent isAbsent |
	anEntry := OmEntry content: 42.
	
	store newEntry: anEntry.

	self beforeAndAfterFlushStore: [
		isPresent := false.
		isAbsent := false.	

		store 
			entryFor: (store referenceTo: anEntry)
			ifPresent: [ :e | isPresent := true ] 
			ifAbsent: [ isAbsent := true ].

		self assert: isPresent.
		self deny: isAbsent ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testEntryReferences [
	| entryReferences |

	1 to: 7 do: [ :each | store newEntry: (OmEntry content: each) ].

	entryReferences := store entryReferences.
	
	entryReferences do: [:each |
		store
			entryFor: each
			ifPresent: [:entry | "ok" ]
			ifAbsent: [ self fail ] ].

	self assert: entryReferences size equals: 7. "To be sure it tests something"

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testFirstEntryIfAbsent [

	| absent |
	absent := false.
	store firstEntryIfAbsent: [ absent := true ].
	self assert: absent.
	
	store newEntry: (OmEntry content: 42).
	store newEntry: (OmEntry content: 43).
	
	self beforeAndAfterFlushStore: [
		self 
			assert: (store firstEntryIfAbsent: [ self fail ])
			equals: store entries first ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testHeadReference [
	1 to: 7 do: [ :each | store newEntry: (OmEntry content: each) ].

	self beforeAndAfterFlushStore: [
		| lastEntry |
		lastEntry := store entries detect: [ :entry | entry content = 7 ].
		self
			assert: store headReference
			equals: (store referenceTo: lastEntry) ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testHeadReferenceForEmptyStore [

	self assert: store headReference equals: OmNullReference uniqueInstance.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testMultipleEntries [
	1 to: 7 do: [ :each | store newEntry: (OmEntry content: each) ].
	
	self beforeAndAfterFlushStore: [
		self
			assert: (store entries collect: #content as: Set)
			equals: (1 to: 7) asSet ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testNewEntry [
	anEntry := OmEntry content: 42.
	
	store newEntry: anEntry.
	
	self beforeAndAfterFlushStore: [
		self 
			assert: (store entries collect: #content as: Array)
			equals: #(42) ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testReferenceTo [
	anEntry := OmEntry content: 42.
	
	store newEntry: anEntry.
	
	self beforeAndAfterFlushStore: [
		aReference := store referenceTo: anEntry.

		self assert: (aReference isKindOf: OmReference).
		self deny: aReference isNull ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testRefreshEmpty [
	store refresh.
	
	self assert: store entries isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testRefreshNotEmpty [
	anEntry := OmEntry content: 42.
	
	store newEntry: anEntry.
	
	store refresh.
	
	self 
		assert: (store entries collect: #content as: Array)
		equals: #(42)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmStoreTest>>testWritingFileReference [

	anEntry := OmEntry content: 42.
	store newEntry: anEntry.
	store flush.
	
	self assert: store writingFileReference isFile.
]
