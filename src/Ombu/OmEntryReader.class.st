"
I implement how to read entries from a stream.
"
Class {
	#name : #OmEntryReader,
	#superclass : #Object,
	#instVars : [
		'stream',
		'store'
	],
	#category : #Ombu-Persistence,
	#timestamp : 'MartinDias 12/12/2014 16:10'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader class>>newForStore: aFileStore [
	
	^ self basicNew
		initializeWithStore: aFileStore;
		yourself

]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader>>entryPositionsDo: aBlock [
	
	^ self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader>>initializeWithStore: aFileStore [

	self initialize.
	store := aFileStore.
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader>>nextEntry [
	"Read next entry from the stream."
	
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader>>store [
	^ store
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader>>stream [

	^ stream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmEntryReader>>stream: aReadStream [

	stream := aReadStream
]
