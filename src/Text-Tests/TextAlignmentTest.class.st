"
SUnit tests for class TextAlignment
"
Class {
	#name : #TextAlignmentTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests,
	#timestamp : 'TorstenBergmann 1/31/2014 12:23'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextAlignmentTest>>setUp [
	super setUp.
	prototypes add: TextAlignment centered;
		 add: TextAlignment justified;
		 add: TextAlignment leftFlush;
		 add: TextAlignment rightFlush 
]
