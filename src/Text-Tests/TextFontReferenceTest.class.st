"
SUnit tests for TextFontReference
"
Class {
	#name : #TextFontReferenceTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests,
	#timestamp : 'TorstenBergmann 1/31/2014 12:24'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextFontReferenceTest>>setUp [
	super setUp.
	prototypes
		add: (TextFontReference
				toFont: (StrikeFont familyName: 'NewYork' size: 15)) 
]
