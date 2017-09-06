"
This is the unit test for the class ReadWriteStream.
Unit tests are a good way to exercise the
functionality of your system in a repeatable and
automatic manner. They are therefore recommended if
you plan to release anything. For more information,
see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org/)
	- the sunit class category
"
Class {
	#name : #ReadWriteStreamTest,
	#superclass : #ClassTestCase,
	#category : #Collections-Tests-Streams,
	#timestamp : '<historical>'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadWriteStreamTest>>testConstructionUsingWith [
	"Use the with: constructor."

	| aStream |
	aStream := ReadWriteStream with: #(1 2).
	self assert: (aStream contents = #(1 2)) description: 'Ensure correct initialization.'
]

{
	#category : #'tests - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadWriteStreamTest>>testIsEmpty [
	| stream |
	stream := ReadWriteStream on: String new.
	self assert: stream isEmpty.
	stream nextPut: $a.
	self deny: stream isEmpty.
	stream reset.
	self deny: stream isEmpty.
	stream next.
	self deny: stream isEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
ReadWriteStreamTest>>testNew [

	self should: [ReadWriteStream new] raise: Error.
]
