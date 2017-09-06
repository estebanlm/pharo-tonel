"
SUnit tests for large negative integers
"
Class {
	#name : #LargeNegativeIntegerTest,
	#superclass : #ClassTestCase,
	#category : #Kernel-Tests-Numbers,
	#timestamp : 'TorstenBergmann 2/5/2014 08:40'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
LargeNegativeIntegerTest>>testEmptyTemplate [
	"Check that an uninitialized instance behaves reasonably."

	| i |
	i := LargeNegativeInteger new: 4.
	self assert: i size = 4.
	self assert: i printString = '-0'.
	self assert: i normalize = 0
]
