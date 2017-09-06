"
I am an SUnit test for ReadStream.
I have no test fixtures.
"
Class {
	#name : #ReadStreamTest,
	#superclass : #TestCase,
	#category : #Collections-Tests-Streams,
	#timestamp : 'tlk 12/5/2004 14:36'
}

{
	#category : #'accessing - defaults',
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>emptyStream [
	^ ReadStream on: String new.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>streamOn: collection upToAll: subcollection  [
	^ collection readStream upToAll: subcollection
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>streamOn: collection upToAll: subcollection1 upToAll: subcollection2  [
	^ collection readStream
		upToAll: subcollection1;
		upToAll: subcollection2
]

{
	#category : #'accessing - defaults',
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>streamOnArray [
	^ ReadStream on: (Array with: 1 with: #(a b c) with: false).
]

{
	#category : #'accessing - defaults',
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>streamOnString [
	^ ReadStream on: 'abcde'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testBack [
	|stream|
	stream := 'abc' readStream.
	stream setToEnd.
	self assert: stream back = $c.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testBackOnPosition1 [
	"Test the new implementation of the method back."
	|stream|
	stream := 'abc' readStream.
	stream next.
	self assert: stream back = $a.

]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testIsEmpty [
	| stream |
	self assert: self emptyStream isEmpty.
	
	stream := self streamOnArray.
	self deny: stream isEmpty.
	stream skip: 3.
	self deny: stream isEmpty.
	
	stream := self streamOnString.
	self deny: stream isEmpty.
	stream next;next;next.
	self deny: stream isEmpty.
	stream setToEnd.
	self deny: stream isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testOldBack [
	"Test the old behavior of the method back. The method #oldBack is a misconception about what a stream is. A stream contains a pointer *between* elements with past and future elements. The method #oldBack considers that the pointer is *on* an element. (Damien Cassou - 1 August 2007)"
	|stream|
	stream := 'abc' readStream.
	stream setToEnd.
	self assert: stream oldBack = $b.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testOldBackOnPosition1 [
	"Test the old behavior of the method back. The method #oldBack is a misconception about what a stream is. A stream contains a pointer *between* elements with past and future elements. The method #oldBack considers that the pointer is *on* an element. (Damien Cassou - 1 August 2007)"

	| stream |
	stream := 'abc' readStream.
	stream next.
	self assert: stream oldBack isNil
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testOldPeekBack [
	"Test the old behavior of the method peekBack. The method #oldBack is a misconception about what a stream is. A stream contains a pointer *between* elements with past and future elements. The method #oldBack considers that the pointer is *on* an element. (Damien Cassou - 1 August 2007)"
	|stream|
	stream := 'abc' readStream.
	stream setToEnd.
	self assert: stream oldPeekBack = $b.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testPeekBack [
	"Test the new implementation of the method peekBack due to changing #back."
	|stream|
	stream := 'abc' readStream.
	stream setToEnd.
	self assert: stream peekBack = $c.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testPositionOfSubCollection [
	
	self assert: ('xyz' readStream positionOfSubCollection: 'q' ) = 0.
	self assert: ('xyz' readStream positionOfSubCollection: 'x' ) = 1.

	self assert: ('xyz' readStream positionOfSubCollection: 'y' ) = 2.
	self assert: ('xyz' readStream positionOfSubCollection: 'z' ) = 3.
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testUpTo3 [
	| stream string |
	string := 'XYZabcdUVW'.
	stream := ReadStream on: string from: (string indexOf: $a) to: (string indexOf: $d).
	self assert: stream upToEnd = 'abcd'.
	self assert: stream atEnd.
	stream := ReadStream on: string from: (string indexOf: $a) to: (string indexOf: $d).
	self assert: (stream upTo: $c) = 'ab'.
	self assert: stream next = $d.
	stream := ReadStream on: string from: (string indexOf: $a) to: (string indexOf: $d).
	self assert: (stream upTo: $e) = 'abcd'.
	self assert: stream atEnd.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadStreamTest>>testUpToAll [

	self assert: (self streamOn: 'abcdefgh' upToAll: 'cd') = 'ab'.
	self assert: (self streamOn: 'abcdefgh' upToAll: 'cd' upToAll: 'gh') = 'ef'.

	self assert: (self streamOn: '' upToAll: '') = ''.

	self assert: (self streamOn: 'a' upToAll: '') = ''.
	self assert: (self streamOn: 'a' upToAll: 'a') = ''.
	self assert: (self streamOn: 'a' upToAll: 'b') = 'a'.

	self assert: (self streamOn: 'ab' upToAll: '') = ''.
	self assert: (self streamOn: 'ab' upToAll: 'a') = ''.
	self assert: (self streamOn: 'ab' upToAll: 'b') = 'a'.
	self assert: (self streamOn: 'ab' upToAll: 'c') = 'ab'.
	self assert: (self streamOn: 'ab' upToAll: 'ab') = ''.

	self assert: (self streamOn: 'abc' upToAll: '') = ''.
	self assert: (self streamOn: 'abc' upToAll: 'a') = ''.
	self assert: (self streamOn: 'abc' upToAll: 'b') = 'a'.
	self assert: (self streamOn: 'abc' upToAll: 'c') = 'ab'.
	self assert: (self streamOn: 'abc' upToAll: 'd') = 'abc'.
	self assert: (self streamOn: 'abc' upToAll: 'ab') = ''.
	self assert: (self streamOn: 'abc' upToAll: 'bc') = 'a'.
	self assert: (self streamOn: 'abc' upToAll: 'cd') = 'abc'.

]
