"

"
Class {
	#name : #ZipWriteStreamTests,
	#superclass : #TestCase,
	#category : #Compression-Tests-Streams,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ZipWriteStreamTests>>testEmptyStrings [
	| aStream zipStream |

	aStream := ByteArray new writeStream binary.
	zipStream := ZipWriteStream on: aStream.
	zipStream nextStringPut: ''. 
	zipStream nextStringPut: ''.
	zipStream close.
	aStream close.
	aStream := aStream contents readStream binary.
	zipStream := ZipReadStream on: aStream.
	self assert: zipStream nextString isEmpty. 
	self assert: zipStream nextString isEmpty.
	zipStream close.
	aStream close.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:41'
}
ZipWriteStreamTests>>testZipped [
	| compressed |
	
	compressed := 'hello' zipped.
	self assert: (compressed unzipped = 'hello').
]
