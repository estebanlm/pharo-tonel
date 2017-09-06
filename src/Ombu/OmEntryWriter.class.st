"
I implement how to write entries to a stream.
"
Class {
	#name : #OmEntryWriter,
	#superclass : #Object,
	#instVars : [
		'store'
	],
	#category : #Ombu-Persistence,
	#timestamp : 'MartinDias 12/12/2014 16:10'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryWriter class>>newForStore: aFileStore [
	
	^ self basicNew
		initializeWithStore: aFileStore;
		yourself

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryWriter>>initializeWithStore: aFileStore [

	self initialize.
	store := aFileStore.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryWriter>>on: aStream nextEntryPut: anEntry  [
	"Write the entry on the stream."
	
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryWriter>>store [
	^ store
]
