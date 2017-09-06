"
Use FileReference>>nextVersion to find the new name.
"
Class {
	#name : #OmSequentialSuffixStrategy,
	#superclass : #OmSessionStoreNamingStrategy,
	#category : #Ombu-Strategies,
	#timestamp : 'MartinDias 1/21/2017 01:28'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSequentialSuffixStrategy>>nextTo: aName in: aDirectory [
	
	| fileReference |
	fileReference := OmFileStore
		fileReferenceForStoreNamed: aName
		inDirectory: aDirectory.
	
	^ fileReference nextVersion basenameWithoutExtension

]
