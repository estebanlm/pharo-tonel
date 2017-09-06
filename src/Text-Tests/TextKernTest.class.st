"
SUnit tests for class TextKern
"
Class {
	#name : #TextKernTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests,
	#timestamp : 'TorstenBergmann 1/31/2014 12:25'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextKernTest>>setUp [
	super setUp.
	prototypes
		add: (TextKern kern: 1) 
]
