Class {
	#name : #FileStreamTest,
	#superclass : #ClassTestCase,
	#category : #Tests-Files
}

{ #category : #private }
FileStreamTest >> doTestsForReading: count intoBufferWithSize: readSize startingAt: startIndex fromFileOfSize: writeSize offsetBy: startOffset [
	"Do the actual assertions for read/write buffers with the given parameters
	
	If offset > 0, some elements will be fetched from buffer.
	If count > writeSize - startOffset, not all will be successfully read."
	
 	| file  filename |
	filename :=  'filestream.tst'.
	[ |writeBuffer  readBuffer bytesRead|
	writeBuffer := (ByteArray new: writeSize).
	0 to: writeSize -1 do: [:ix | writeBuffer at: ix +1 put: (ix \\ 255) + 1].

	(StandardFileStream forceNewFileNamed: filename)
		 binary ;
		 nextPutAll: writeBuffer ;
		 close.
	file := StandardFileStream readOnlyFileNamed: filename.
	
	readBuffer := ByteArray new: readSize.

	startOffset > 0 ifTrue: [file next: startOffset].
	bytesRead := file
		readInto: readBuffer
		startingAt: startIndex
		count: count.
	"Test the count is correct, ie. either read count, or the remaining bytes in write buffer"
	self assert: ((writeSize - startOffset) min: count) equals: bytesRead.
	
	"quick test for total not written"
	self assert: readSize - bytesRead equals: (readBuffer occurrencesOf: 0).
	
	"compare test for readStream and what was in write"
	1 to: readSize do:
		[ : n | |expected|
		expected := 
			(n between: startIndex and: startIndex + bytesRead -1)
				ifTrue: [ (writeBuffer at: startOffset + n - startIndex +1) ]
				ifFalse: [ 0 ].	
		self assert: expected equals: (readBuffer at: n)  ] ]
	ensure: [ 
		file ifNotNil: [ file close ].
		(FileSystem disk workingDirectory / filename) ensureDelete ]
]

{ #category : #testing }
FileStreamTest >> testCachingNextChunkPut [
	"Ensure that nextChunkPut:/nextChunk works properly on a caching file"
	| file text read filename |
	filename := 'testCachingNextChunkPut'.
	[file := FileStream forceNewFileNamed: filename.
	text := 'this is a chunkful of text'.
	file nextChunkPut: text.
	read := [file position: 0; nextChunk] valueWithin: 1 seconds onTimeout:[''].
	self assert: read = text.
	] ensure:[
		file close. 
		(FileSystem disk workingDirectory / filename) ensureDelete ].
]

{ #category : #testing }
FileStreamTest >> testDetectFileDo [
	| file |
	[ file := 'filestream.tst' asFileReference.
	file writeStreamDo: [ :s | s nextPutAll: '42' ].
	FileStream
		detectFile: [ file readStream ]
		do: [ :stream | 
			self assert: stream notNil.
			self deny: stream closed.
			self assert: stream contentsOfEntireFile = '42']]
		ensure: [
			file ensureDelete ].
]

{ #category : #testing }
FileStreamTest >> testFileTruncation [
	"Ensure that nextChunkPut:/nextChunk works properly on a caching file"

	"self debug: #testFileTruncation"

	| file |
	file := 'TruncationTest.txt' asFileReference.
	[ 
	file writeStreamDo: [ :s | s nextPutAll: '1234567890' ].
	file
		writeStreamDo: [ :s | 
			self assert: s contents equals: '1234567890'.
			s truncate: 4 ].
	file readStreamDo: [ :s | self assert: s contents equals: '1234' ] ]
		ensure: [ file ensureDelete ]
]

{ #category : #testing }
FileStreamTest >> testNextChunkOutOfBounds [
	"self debug: #testNextChunkOutOfBounds"
	
	"Ensure that nextChunkPut:/nextChunk works properly on a caching file"
	| file text read filename |
	filename := 'testNextChunkOutOfBounds'.
	[file := FileStream forceNewFileNamed: filename.
	text := 'this is a chunkful of text'.
	file nextChunkPut: text.
	read := [file position: 999999; nextChunk] valueWithin: 1 seconds onTimeout:[nil].
	self assert: read = ''.
	] ensure: [ 
		file close.
		(FileSystem disk workingDirectory / filename) ensureDelete ].
]

{ #category : #testing }
FileStreamTest >> testNextLine [
	| filename lines text |
	filename := 'filestream.tst'.
	lines := #('line 1' ' and line 2' '' 'fourth').
	text := lines first , String cr , lines second , String crlf , lines third , String lf , lines fourth.
	[ 
	| file |
	(StandardFileStream forceNewFileNamed: filename)
		nextPutAll: text;
		close.
	file := StandardFileStream readOnlyFileNamed: filename.
	lines do: [ :e | self assert: file nextLine = e ].
	self assert: file nextLine isNil.
	file close ] ensure: [ 
		(FileSystem disk workingDirectory / filename) ensureDelete ].
]

{ #category : #testing }
FileStreamTest >> testReadIntoStartingAtCountAll [
	"Tests for correct count and contents when all could be read, none pre-buffered"
	self doTestsForReading: 100 
		intoBufferWithSize: 400 
		startingAt: 100 
		fromFileOfSize: 200 
		offsetBy: 0.
	
]

{ #category : #testing }
FileStreamTest >> testReadIntoStartingAtCountBufferedAll [
	"Tests for correct count and contents when all could be read, some pre-buffered"
	self doTestsForReading: 5000 
		intoBufferWithSize: 6000 
		startingAt: 500 
		fromFileOfSize: 6000 
		offsetBy: 200.
]

{ #category : #testing }
FileStreamTest >> testReadIntoStartingAtCountBufferedNotAll [
	"Tests for correct count and contents when all could be read, some pre-buffered"
	self doTestsForReading: 8000 
		intoBufferWithSize: 10000 
		startingAt: 500 
		fromFileOfSize: 6000 
		offsetBy: 200.
]

{ #category : #testing }
FileStreamTest >> testReadIntoStartingAtCountNotAll [
	
	"Tests for correct count and contents when not all could be read, and none pre-buffered"
	self doTestsForReading: 500 
		intoBufferWithSize: 800 
		startingAt: 10 
		fromFileOfSize: 300 
		offsetBy: 0.
]
