"
I am ZnFileRetrieveContents.
I am a ZnUrlOperation.

I implement the #retrieveContents URL operation for FILE urls.

Part of Zinc HTTP Components.

"
Class {
	#name : #ZnFileRetrieveContents,
	#superclass : #ZnUrlOperation,
	#category : #Zinc-Resource-Meta-FileSystem,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnFileRetrieveContents class>>operation [
	^ #retrieveContents
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnFileRetrieveContents class>>schemes [
	^ #( #file )
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnFileRetrieveContents>>performOperation [
	"Download and return the FILE resource that url refers to.
	This will typically return a String or a ByteArray (see AbstractFileReference>>#contents).
	If something goes wrong, an exception will be signalled."
	
	^ self url asFileReference contents
]
