"

"
Class {
	#name : #BaseStreamTest,
	#superclass : #TestCase,
	#category : #Tests-Files,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
BaseStreamTest class>>isAbstract [
	^ self = BaseStreamTest.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
BaseStreamTest class>>isUnitTest [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BaseStreamTest>>baseStreamType [
	"Answer the stream type to be tested"
	self shouldBeImplemented.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BaseStreamTest>>testFileName [
	^ self class name,'_', testSelector , '_test'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BaseStreamTest>>testFileNamed [
	| testString fileName |
	"Given"
	fileName := self testFileName.
	testString := 'testString'.
	"When"
	[self baseStreamType
		fileNamed: fileName
		do: [:streamType | streamType nextPut: testString].
	"Then"
	self baseStreamType
		fileNamed: fileName
		do: [:streamType | self assert: streamType next = testString]]
		ensure: [ (FileSystem disk workingDirectory / fileName) ensureDelete ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
BaseStreamTest>>testReadOnlyFileNamed [
	| testString fileName file |
	"Given"
	fileName := self testFileName.
	testString := 'testString'.
	"When"
	[self baseStreamType
		fileNamed: fileName
		do: [:streamType | streamType nextPut: testString].
	"Then"
	file := self baseStreamType readOnlyFileNamed: fileName.
	self assert: file next = testString.
	file close]
		ensure: [ fileName asFileReference delete ]
]
