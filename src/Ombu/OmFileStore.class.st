"
I am a single-file store of entries. Each new entry is appended at the end. Entries are lazily read from file on demand.
"
Class {
	#name : #OmFileStore,
	#superclass : #OmStore,
	#instVars : [
		'globalName',
		'headReference',
		'fileReference',
		'entryPositionsByLocalName',
		'entryCount',
		'entryReader',
		'writingDeferrer',
		'entryByLocalName',
		'mustRefresh',
		'entryBuffer',
		'lock',
		'lastStreamPosition'
	],
	#category : #Ombu-Stores,
	#timestamp : 'MartinDias 5/30/2014 18:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>defaultFileSuffix [

	^ '.ombu'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>defaultWritingDeferDuration [

	^ 250 milliSeconds
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>existsStoreNamed: aGlobalName inDirectory: aFileReference [

	^ aFileReference exists and: [
		(self 
			fileReferenceForStoreNamed: aGlobalName 
			inDirectory: aFileReference) exists ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>fileReferenceForStoreNamed: aGlobalName inDirectory: baseDirectoryFileReference [

	^ baseDirectoryFileReference / (aGlobalName, self defaultFileSuffix)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>fromFile: aFileReference [

	^ self 
		named: aFileReference basenameWithoutExtension
		inFile: aFileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>globalNameFrom: directoryEntryOrFileReference [

	^ directoryEntryOrFileReference asFileReference basenameWithoutExtension
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>named: aGlobalName [
	^ self 
		named: aGlobalName
		inDirectory: FileSystem memory
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>named: aGlobalName inDirectory: baseDirectoryFileReference [

	^ self
		named: aGlobalName
		inFile: (self fileReferenceForStoreNamed: aGlobalName inDirectory: baseDirectoryFileReference)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>named: aName inFile: aFileReference [

	^ self basicNew 
		initializeWithGlobalName: aName
		fileReference: aFileReference;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore class>>new [

	^ self named: UUID new asString36
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>checkIfMustRefresh [

	mustRefresh ifTrue: [ self refresh ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>copyReopened [

	^ self species named: globalName inFile: fileReference
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>critical: aBlock [

	lock ifNil: [
		lock := Semaphore forMutualExclusion ].

	^ lock critical: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>ensureDeleteFile [
	"After execution of this method, the .ombu file this instance represents will not exist."
	
	^ self fileReference ensureDelete
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entriesCount [
	"Answer the number of entries that this store contains"

	self checkIfMustRefresh.
	
	^ entryCount
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entriesDo: aBlockClosure  [
	"Evaluate the closure on each entry"

	self fileReference exists ifTrue: [
		self readEntriesWith: [:readStream | 
			| reader |
			reader := self newEntryReader.
			reader stream: readStream.
			[ readStream atEnd ] whileFalse: [
				aBlockClosure value: reader nextEntry ] ] ].

	"Finally, the entries still not written"
	self entryBufferDo: [:entryAndLocalName | 
		aBlockClosure value: entryAndLocalName key ].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entryBuffer [

	^ entryBuffer ifNil: [ entryBuffer := OrderedCollection new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entryBufferDo: aBlock [
	"Iterate the entryBuffer taking care of performance (avoid triggering the lazy initialization)."

	entryBuffer ifNotNil: [
		"Create a new Array instance on purpose, to avoid any possible concurrency issue, since the original collection may mutate buring the iteration."
		entryBuffer asArray do: aBlock ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entryByLocalName [

	^ entryByLocalName ifNil: [ entryByLocalName := WeakValueDictionary new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [

	(aReference isNull or: [ aReference globalName ~= self globalName])
		ifTrue: [ ^ absentBlockClosure value ].

	^ self entryByLocalName
		at: aReference localName
		ifPresent: presentBlockClosure
		ifAbsentOrNil: [
			self
				readEntryForLocalName: aReference localName
				ifPresent: [ :entry |
					self entryByLocalName at: aReference localName put: entry.
					presentBlockClosure value: entry ] 
				ifAbsent: absentBlockClosure ]

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entryPositionsByLocalName [
	
	self checkIfMustRefresh.
	
	^ entryPositionsByLocalName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>entryReferences [
	
	^ (self entriesCount to: 1 by: -1) collect: [:index |
			self referenceToLocalName: index asString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>fileReference [

	^ fileReference
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>firstEntryIfAbsent: absentBlock [

	^ [ super firstEntryIfAbsent: absentBlock ] 
			on: Error 
			do: absentBlock
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>flush [

	self writingDeferrer flush
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>flushEntryBuffer [

	self critical: [
		| initialPosition initialLocalName |
		self entryBuffer isEmpty ifTrue: [ ^self ].
		
		fileReference writeStreamDo: [:fileStream |
			fileStream setToEnd.
			
			initialPosition := fileStream position.
			initialLocalName := self entryBuffer first value.
		
			ZnBufferedWriteStream on: fileStream do: [:aWriteStream |
				| anEntryWriter |
				anEntryWriter := self newEntryWriter.

				[ self entryBuffer isEmpty ] whileFalse: [
					| next entry |
					next := self entryBuffer removeFirst.
					entry := next key.

					"Write entry to file"
					anEntryWriter
						on: aWriteStream 
						nextEntryPut: entry.
					].
				].

			"In Linux it was necessary to explicitely flush the file stream"
			fileStream flush.
			
			lastStreamPosition := fileStream size.
			].
	
		self refreshEntryPositionsByLocalNameStartingAt: initialPosition since: initialLocalName.
		].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>globalName [

	^ globalName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>headReference [

	self checkIfMustRefresh.

	^ headReference
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>initialize [

	super initialize.
	
	entryCount := 0.
	entryPositionsByLocalName := Dictionary new.
	headReference := OmNullReference uniqueInstance.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>initializeWithGlobalName: aName fileReference: aFileReference [

	self initialize.
	
	globalName := aName.
	fileReference := aFileReference.
	mustRefresh := fileReference exists. "Late file read"

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>isOutdated [
	"Answer if #refresh is needed. To that end, I check if the file has different size than last time I wrote."

	^ self fileReference exists
		ifTrue: [ self fileReference size ~= lastStreamPosition ]
		ifFalse: [ lastStreamPosition isNotNil ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>lowLevelFileStoreIfNone: aBlock [
	"Needed by EpLostChangesDetector"
	
	^ self
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>newEntry: anEntry [

	self critical: [
		| newReference localName |
		entryCount := entryCount + 1.

		"Build new entry"
		localName := entryCount asString.
		newReference := self referenceToLocalName: localName.
		anEntry tags at: self selfReferenceKey put: newReference.

		"Update head"
		headReference := newReference.

		"Cache (weak)"
		self entryByLocalName at: localName put: anEntry.

		"Defer write"
		self entryBuffer addLast: anEntry -> localName.
		self writingDeferrer schedule.
		]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>newEntryReader [
	
	^ OmSTONEntryReader newForStore: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>newEntryWriter [

	^ OmSTONEntryWriter newForStore: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>nextEntryFromPosition: aFilePosition [

	^ self readEntriesWith: [ :readStream |
		readStream position: aFilePosition.
		self newEntryReader stream: readStream; nextEntry ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>printOn: aStream [

	super printOn: aStream.
	
	aStream 
		nextPut: $(;
		nextPutAll: self globalName;
		nextPut: $)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>readEntriesWith: aBlockClosure [

	self fileReference readStreamDo: [ :readStream | [
		^ aBlockClosure value: readStream ascii ]
			on: Error
			do: [ :error |
				(OmFileStoreReadingError 
					readingError: error
					on: self fileReference
					position: readStream position) signal ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>readEntryForLocalName: aString ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [

	^ self entryPositionsByLocalName 
		at: aString
		ifPresent: [ :position |
			presentBlockClosure value: (self nextEntryFromPosition: position) ]
		ifAbsent: absentBlockClosure

]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>refresh [

	self flush.

	self critical: [
		mustRefresh := false.
		self initialize.
		self fileReference exists ifFalse: [ ^self ].
		self readEntriesWith: [:readStream | [
			self newEntryReader
				stream: readStream;
				entryPositionsDo: [ :entryPosition |
					entryCount := entryCount + 1.
					entryPositionsByLocalName at: entryCount asString put: entryPosition ]
			] ensure: [
				headReference := self referenceToLocalName: entryCount asString ]
			]
		]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>refreshEntryPositionsByLocalNameStartingAt: firstStreamPosition since: initialLocalName [
	"Workaround needed because can't get real file stream position from ZnBufferedWriteStream. 
	(+ would need special care of WideStrings)"

	| localNameAsInteger |
	localNameAsInteger := initialLocalName asInteger.

	self readEntriesWith: [:readStream |
		readStream position: firstStreamPosition.
		self newEntryReader
			stream: readStream;
			entryPositionsDo: [ :entryPosition |
				entryPositionsByLocalName at: localNameAsInteger asString put: entryPosition.
				localNameAsInteger := localNameAsInteger + 1 ].
		].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>writingDeferDuration [

	^ self writingDeferrer duration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>writingDeferDuration: aDuration [

	self writingDeferrer duration: aDuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>writingDeferrer [

	^ writingDeferrer ifNil: [
		writingDeferrer := OmDeferrer 
			send: #flushEntryBuffer 
			to: self
			after: self class defaultWritingDeferDuration ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStore>>writingFileReference [
	
	^ fileReference
]
