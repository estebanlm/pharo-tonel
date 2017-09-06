"

"
Class {
	#name : #OmSessionStoreTest,
	#superclass : #OmStoreTest,
	#category : #OmbuTests,
	#timestamp : ''
}

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>directoryForTests [

	^ FileSystem workingDirectory
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>setUpOtherStore [

	^ OmSessionStore newWithBaseLocator: (self directoryForTests / 'test-sessions-other') ensureCreateDirectory
]

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>setUpStore	 [

	^ OmSessionStore newWithBaseLocator: (self directoryForTests / 'test-sessions-main') ensureCreateDirectory
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>tearDown [
	super tearDown.
	
	(self directoryForTests / 'test-sessions-main') ensureDeleteAll.
	(self directoryForTests / 'test-sessions-other') ensureDeleteAll.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>testResetWithNextStoreNameWithRandomSuffix [

	| aFileReference anotherFileReference |
	store storeNameStrategy: OmRandomSuffixStrategy new.

	store resetWithNextStoreName.
	aFileReference := store writingFileReference.
	store resetWithNextStoreName.
	anotherFileReference := store writingFileReference.
	
	self deny: aFileReference = anotherFileReference
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>testResetWithNextStoreNameWithSequentialSuffix [
	"The sequencial suffix doesn't change unless the file is created"
	
	| aFileReference anotherFileReference |
	store storeNameStrategy: OmSequentialSuffixStrategy new.
	
	store resetWithNextStoreName.
	aFileReference := store writingFileReference.
	store resetWithNextStoreName.
	anotherFileReference := store writingFileReference.
	
	self assert: aFileReference equals: anotherFileReference.
	
	store newEntry: (OmEntry content: 42).
	store flush.
	store resetWithNextStoreName.
	anotherFileReference := store writingFileReference.
	self deny: aFileReference = anotherFileReference.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>testResetWithNextStoreNameWithTimeStampSuffix [

	| aFileReference anotherFileReference |
	store storeNameStrategy: OmTimeStampSuffixStrategy new.

	store resetWithNextStoreName.
	aFileReference := store writingFileReference.
	50 milliSeconds wait.
	store resetWithNextStoreName.
	anotherFileReference := store writingFileReference.
	
	self deny: aFileReference = anotherFileReference
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>testResetWithStoreNamedDoesAnnounce [

	| wasAnnounced |
	wasAnnounced := false.

	store announcer
		subscribe: OmSessionStoreUpdated
		do: [ :announcement | wasAnnounced := true ].
	
	[ store resetWithStoreNamed: 'new' ] 
		ensure: [ store announcer unsubscribe: self ].

	self assert: wasAnnounced
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreTest>>testResetWithStoreNamedSignalsErrorIfFileAlreadyExists [
	
	store resetWithStoreNamed: 'pepe'.
	store newEntry: (OmEntry content: 42).
	store flush.
	
	self 
		should: [ store resetWithStoreNamed: 'pepe' ]
		raise: FileExists
]
