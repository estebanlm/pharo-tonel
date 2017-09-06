"

"
Class {
	#name : #GLMFormattedPresentationTest,
	#superclass : #TestCase,
	#category : #Glamour-Tests-Core,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMFormattedPresentationTest>>testFormat [
	| presentation |
	presentation := GLMFormatedPresentation new.
	presentation format: [ :c | c ].
	self assert: (presentation formatedDisplayValueOf: 1) equals: 1.
	presentation entity: 41.
	presentation format: [ :a :c | a + c ].
	self assert: (presentation formatedDisplayValueOf: 1) equals: 42.
	presentation entity: (GLMMultiValue with: 20 with: 21).
	presentation format: [ :a :b :c | a + b + c ].
	self assert: (presentation formatedDisplayValueOf: 1) equals: 42
]
