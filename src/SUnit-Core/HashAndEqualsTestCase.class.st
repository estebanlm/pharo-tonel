"
I am a simple TestCase that tests for correct operation of #hash and #=.

Subclasses of me need to fill my prototypes with suitable objects to be tested.
"
Class {
	#name : #HashAndEqualsTestCase,
	#superclass : #TestCase,
	#instVars : [
		'prototypes'
	],
	#category : #SUnit-Core-Utilities,
	#timestamp : 'mjr 8/20/2003 17:37'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:08'
}
HashAndEqualsTestCase>>setUp [
	"subclasses will add their prototypes into this collection"
	prototypes := OrderedCollection new 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
HashAndEqualsTestCase>>testEquality [
	"Check that TextFontChanges report equality correctly"
	prototypes
		do: [:p | self
				should: [(EqualityTester with: p) result]] 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:08'
}
HashAndEqualsTestCase>>testHash [
	"test that TextFontChanges hash correctly"
	prototypes do: [:p |
		self should: [(HashTester with: p) result]] 
]
