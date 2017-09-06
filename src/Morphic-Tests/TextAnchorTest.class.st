"

"
Class {
	#name : #TextAnchorTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #'Morphic-Tests-Text Support',
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
TextAnchorTest>>setUp [
	super setUp.
	prototypes
		add: (TextAnchor new anchoredMorph: Morph new initialize);
		
		add: (TextAnchor new anchoredMorph: EllipseMorph new initialize) 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
TextAnchorTest>>testMorphInline [

	| text morphTextAttribute |
	text := 'Hello ' asText, Morph new asText, ' world' asText.

	"Stupid assertion, but this test is mostly a usage example"
	morphTextAttribute := text attributesAt: 7.
	self assert: (morphTextAttribute first isKindOf: TextAnchor)
]
