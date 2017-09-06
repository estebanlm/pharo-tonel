"

"
Class {
	#name : #ZipExtensionTests,
	#superclass : #TestCase,
	#category : #Compression-Tests-Streams,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ZipExtensionTests>>testZipped [
	| compressed |
	
	compressed := 'hello' zipped.
	self assert: (compressed unzipped = 'hello').
]
