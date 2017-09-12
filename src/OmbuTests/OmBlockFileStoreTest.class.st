Class {
	#name : #OmBlockFileStoreTest,
	#superclass : #OmFileStoreTest,
	#category : #OmbuTests
}

{ #category : #initialization }
OmBlockFileStoreTest >> setUpOtherStore [

	^ OmBlockFileStore
		named: 'testingOtherStore', UUID new asString36
		inDirectory: self directoryForTests ensureCreateDirectory
]

{ #category : #initialization }
OmBlockFileStoreTest >> setUpStore [	

	^ OmBlockFileStore
		named: 'testingStore', UUID new asString36
		inDirectory: self directoryForTests ensureCreateDirectory
]
