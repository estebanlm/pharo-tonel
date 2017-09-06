"
SUnit tests for AbstractEnumerationVisitor
"
Class {
	#name : #AbstractEnumerationVisitorTest,
	#superclass : #SingleTreeTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:41'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
AbstractEnumerationVisitorTest class>>isAbstract [
	^ self name = #AbstractEnumerationVisitorTest
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
AbstractEnumerationVisitorTest>>assertEntries: references are: expected [
	| strings |
	self assert: references isArray.
	references do: [ :ea | self assert: ea class = FileSystemDirectoryEntry ].
	strings := references collect: [ :ea | ea reference pathString ].
	self assert: strings equals: expected
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
AbstractEnumerationVisitorTest>>root [
	^ filesystem / 'alpha'
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:29'
}
AbstractEnumerationVisitorTest>>setUp [
	super setUp.
	self setUpGreek.
]
