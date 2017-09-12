"
SUnit tests for class TextKern
"
Class {
	#name : #TextKernTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests
}

{ #category : #tests }
TextKernTest >> setUp [
	super setUp.
	prototypes
		add: (TextKern kern: 1) 
]
