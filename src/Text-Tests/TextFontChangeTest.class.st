"
SUnit tests for class TextFontChange
"
Class {
	#name : #TextFontChangeTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests,
	#timestamp : 'TorstenBergmann 1/31/2014 12:23'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextFontChangeTest>>setUp [
	"create the prototypes for testing"
	super setUp.
	prototypes add: TextFontChange defaultFontChange.
	prototypes add: TextFontChange font1.
	prototypes add: TextFontChange font2.
	prototypes add: TextFontChange font3.
	prototypes add: TextFontChange font4.
	prototypes
		add: (TextFontChange fontNumber: 6) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextFontChangeTest>>testEquality [
	"Check that different instances of the same TextFontChange are equal"
	self assert: TextFontChange defaultFontChange = TextFontChange defaultFontChange.
	self assert: TextFontChange font1 = TextFontChange font1.
	self assert: TextFontChange font2 = TextFontChange font2.
	self assert: TextFontChange font3 = TextFontChange font3.
	self assert: TextFontChange font4 = TextFontChange font4.
	self assert: (TextFontChange fontNumber: 6)
			= (TextFontChange fontNumber: 6)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextFontChangeTest>>testHash [
	"test that different instances of the same TextFontChange hash to the 
	same value"
	| hashes hash |
	hashes := OrderedCollection new.
	1
		to: 100
		do: [:i | hashes add: TextFontChange defaultFontChange hash].
	hash := hashes at: 1.
	2
		to: 100
		do: [:i | self assert: (hashes at: i)
					= hash]
]
