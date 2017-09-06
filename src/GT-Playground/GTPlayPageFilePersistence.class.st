"

"
Class {
	#name : #GTPlayPageFilePersistence,
	#superclass : #GTPlayPagePersistence,
	#category : #GT-Playground,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageFilePersistence>>deleteFromFileSystem [
	self fileReference ensureDelete
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageFilePersistence>>fileDirectory [
	^ self subclassResponsibility 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageFilePersistence>>fileName [
	self subclassResponsibility
]

{
	#category : #accessing-dynamic,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageFilePersistence>>fileReference [
	^ self fileDirectory / self fileName
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageFilePersistence>>save [
	self page content isEmpty
		ifTrue: [ self deleteFromFileSystem ]
		ifFalse: [ self writeToFileSystem ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageFilePersistence>>writeToFileSystem [
	self fileReference writeStreamDo: [ :stream | 
		stream 
			truncate; 
			nextPutAll: self page contentString ]
]
