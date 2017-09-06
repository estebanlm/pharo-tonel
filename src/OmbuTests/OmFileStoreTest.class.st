"

"
Class {
	#name : #OmFileStoreTest,
	#superclass : #OmStoreTest,
	#category : #OmbuTests,
	#timestamp : ''
}

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>directoryForTests [

	^ FileSystem workingDirectory
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>setUpOtherStore [

	^ OmFileStore 
		named: 'testingOtherStore', UUID new asString36
		inDirectory: self directoryForTests ensureCreateDirectory
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>setUpStore	 [

	^ OmFileStore 
		named: 'testingStore', UUID new asString36
		inDirectory: self directoryForTests ensureCreateDirectory
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>tearDown [
	super tearDown.
	
	store fileReference ensureDelete.
	otherStore fileReference ensureDelete.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testEnsureDeleteFile [
	| loadedStore |
	store newEntry: (OmEntry content: 42).
	store flush.

	store ensureDeleteFile.
	
	loadedStore := 
		(OmFileStore 
			named: store globalName 
			inDirectory: self directoryForTests)
			refresh;
			yourself.
	
	self assert: loadedStore entriesCount equals: 0.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testIsOutdated [

	self deny: store isOutdated.
	store newEntry: (OmEntry content: 42).
	self deny: store isOutdated.
	store flush.
	self deny: store isOutdated.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testLoadFromCorruptFile1 [
	"Bad character"

	| loadedStore |
	store newEntry: (OmEntry content: 41).
	store newEntry: (OmEntry content: 42).

	"Override first characters"
	store fileReference writeStreamDo: [ :stream | stream nextPutAll: '***' ].
	
	loadedStore := 
		(OmFileStore 
			named: store globalName 
			inDirectory: self directoryForTests)
			yourself.
	
	self 
		should: [ loadedStore refresh; entries ]
		raise: OmFileStoreReadingError
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testLoadFromCorruptFile2 [
	"Bad class name"

	| loadedStore |
	store newEntry: (OmEntry content: 41).
	store newEntry: (OmEntry content: 42).

	"Override first characters"
	store fileReference writeStreamDo: [ :stream | stream nextPutAll: 'OMENTRY' ].
	
	loadedStore := 
		(OmFileStore 
			named: store globalName 
			inDirectory: self directoryForTests)
			yourself.
	
	self 
		should: [ loadedStore refresh; entries ]
		raise: OmFileStoreReadingError
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testLoadFromCorruptFile3 [
	"Bad class name. Last entry."

	| loadedStore |
	store newEntry: (OmEntry content: 41).

	"Override first characters"
	store fileReference writeStreamDo: [ :stream | stream nextPutAll: 'OMENTRY' ].
	
	loadedStore := 
		(OmFileStore 
			named: store globalName 
			inDirectory: self directoryForTests)
			yourself.
	
	self 
		should: [ loadedStore refresh; entries ]
		raise: OmFileStoreReadingError
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testLoadFromCorruptFile4 [
	"Content is corrupted"

	| loadedStore |
	store newEntry: (OmEntry content: 41).
	store newEntry: (OmEntry content: 42).
	store flush.
	
	"Override first characters"
	store fileReference writeStreamDo: [ :stream | 
		stream 
			upToAll: '41';
			skip: -1;
			nextPutAll: '**'.
			
		"Apparently, in Linux it can randomly fail if not explicitely flush"
		stream flush.
		].
	
	loadedStore := 
		(OmFileStore 
			named: store globalName 
			inDirectory: self directoryForTests)
			yourself.
	
	self 
		should: [ loadedStore refresh; entries ]
		raise: OmFileStoreReadingError.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmFileStoreTest>>testLoadFromFile [
	| loadedStore |
	store newEntry: (OmEntry content: 42).
	store flush.
	
	loadedStore := 
		(OmFileStore 
			named: store globalName 
			inDirectory: self directoryForTests)
			refresh;
			yourself.
	
	self 
		assert: (loadedStore entries collect: #content as: Array)
		equals: #(42)
]
