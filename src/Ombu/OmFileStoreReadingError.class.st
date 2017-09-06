"
I am a notification raised when a OmFileStore has a problem reading an entry from its file.
"
Class {
	#name : #OmFileStoreReadingError,
	#superclass : #Error,
	#category : #Ombu-Errors,
	#timestamp : 'MartinDias 9/13/2016 00:17'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmFileStoreReadingError class>>readingError: sourceError on: aFileReference position: aFilePosition [

	^ self new messageText: 'Reading entry from ', aFileReference asString, '@', aFilePosition asString, ': ', sourceError messageText 
]
