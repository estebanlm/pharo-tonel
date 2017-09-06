"

"
Class {
	#name : #BinaryFileStreamTest,
	#superclass : #TestCase,
	#category : #Files-Tests,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>fileStreamForFileNamed: fileName [
	^ (File named: fileName) writeStream
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>killTestFile [

	(File named: 'testFile') exists
		ifTrue: [ (File named: 'testFile') delete ].
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>setUp [

	super setUp.
	self killTestFile.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>tearDown [

	super tearDown.
	self killTestFile.
	"We must ensure that files are collected before running other tests.
	In windows, we cannot open the same file twice."
	3 timesRepeat: [ Smalltalk garbageCollect. ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testEmptyFileIsAtEnd [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	self assert: file atEnd
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testFileWithSomeBytesSizeIsNotZero [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	self assert: file position equals: 1.
	file nextPutAll: #[1 2 3].
	self assert: file position equals: 4.
	file nextPut: 1.
	self assert: file position equals: 5.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testFullFileIsAtEnd [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	self assert: file atEnd.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testOpenFile [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	
	self assert: (File named: 'testFile') exists
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testPeekDoesNotAdvanceTheStream [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	file nextPut: 2.
	file nextPut: 3.
	file close.
	
	file := self fileStreamForFileNamed: 'testFile'.
	self assert: file position equals: 0.
	self assert: file peek equals: file peek.
	self assert: file position equals: 0.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testReadFullFileIsAtEnd [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	file close.
	
	file := self fileStreamForFileNamed: 'testFile'.
	file next.
	self assert: file atEnd.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testReadLessThanAvailableYieldsJustRead [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	file nextPut: 2.
	file nextPut: 3.
	file close.
	
	file := self fileStreamForFileNamed: 'testFile'.
	self assert: (file next:2) equals: #[1 2].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testReadMoreThanAvailableYieldsOnlyAvailable [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	self assert: (file next:2) equals: #[].
	
	"then we put one element and we close it"
	file nextPut: 1.
	file close.
	
	file := self fileStreamForFileNamed: 'testFile'.
	self assert: (file next:2) equals: #[1].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testReadMultipleBytes [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	file nextPut: 2.
	file close.

	file := self fileStreamForFileNamed: 'testFile'.
	self assert: (file next: 2) equals: #[1 2].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testReadWhenNothingAvailableYieldsNil [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	self assert: file next equals: nil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testSkipLecture [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	file nextPut: 2.
	file nextPut: 3.
	file close.
	
	file := self fileStreamForFileNamed: 'testFile'.
	file skip: 2.
	self assert: file next equals: 3.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testWriteMultipleBytes [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPutAll: #[1 2].
	file close.

	file := self fileStreamForFileNamed: 'testFile'.
	self assert: file next equals: 1.
	self assert: file next equals: 2.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testWriteReadInt [
	
	| file |
	file := self fileStreamForFileNamed: 'testFile'.
	file nextPut: 1.
	file close.

	file := self fileStreamForFileNamed: 'testFile'.
	self assert: file next equals: 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:42'
}
BinaryFileStreamTest>>testWriteToClosedFileFails [
	
	| fileStream |
	fileStream := self fileStreamForFileNamed: 'testFile'.
	fileStream close.
	self should: [ fileStream nextPut: 1 ] raise: Error.
]
