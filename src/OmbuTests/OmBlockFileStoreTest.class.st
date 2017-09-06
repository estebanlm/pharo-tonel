"

"
Class {
	#name : #OmBlockFileStoreTest,
	#superclass : #OmFileStoreTest,
	#category : #OmbuTests,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmBlockFileStoreTest>>setUpOtherStore [

	^ OmBlockFileStore
		named: 'testingOtherStore', UUID new asString36
		inDirectory: self directoryForTests ensureCreateDirectory
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmBlockFileStoreTest>>setUpStore	 [

	^ OmBlockFileStore
		named: 'testingStore', UUID new asString36
		inDirectory: self directoryForTests ensureCreateDirectory
]
