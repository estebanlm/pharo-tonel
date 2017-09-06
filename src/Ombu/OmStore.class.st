"
I am a repository of entries.
"
Class {
	#name : #OmStore,
	#superclass : #Object,
	#category : #Ombu-Stores,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore class>>selfReferenceKey [

	^ #self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>directory [
	"Answer the directory where this store is located."

	^ self writingFileReference parent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>entries [
	"Answer all the entries the this store contains"

	| entries |
	entries := OrderedCollection new.

	self entriesDo: [ :entry | entries add: entry ].

	^ entries
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>entriesCount [
	"Answer the number of entries that this store contains"

	^ self entries size
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>entriesDo: aBlockClosure  [
	"Evaluate aBlockClosure with every entries this store contains"

	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>entryFor: aReference [
	"Look for an entry"

	^ self
		entryFor: aReference
		ifPresent: [ :anEntry | ^ anEntry ] 
		ifAbsent: [ NotFound signalFor: aReference ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [
	"Look for an entry, evaluating either the first block closure if present or the second if absent."
	
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>entryReferences [
	"Answer OmReference instances for all the entries in this store"

	^ self entries collect: [:each | self referenceTo: each ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>firstEntryIfAbsent: absentBlock [
	"Answer the first entry of this store, or execute absentBlock"

	self entriesDo: [ :entry | ^ entry ].

	^ absentBlock value
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>flush [
	"Flush any buffered state"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>headReference [
	"Answer a reference to the last entry added to this store."

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>lowLevelFileStoreIfNone: aBlock [
	"Needed by EpLostChangesDetector"
	
	^ self subclassResponsibility
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>newEntry: anEntry [
	"Persist a new entry"
	
	self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>referenceTo: anEntry [
	"Answer a reference to an entry."
	
	^ anEntry tags 
		at: self selfReferenceKey 
		ifAbsent: [ self error: 'Invalid entry: ', anEntry asString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>referenceToLocalName: aString [

	^ OmReference globalName: self globalName localName: aString
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>refresh [
	
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>selfReferenceKey [

	^ self class selfReferenceKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmStore>>writingFileReference [
	"Answer the file reference where the method #newEntry: would persist a new entry."
	
	self subclassResponsibility 
]
