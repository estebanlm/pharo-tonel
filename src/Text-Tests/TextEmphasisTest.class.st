"
SUnit tests for TextEmphasis
"
Class {
	#name : #TextEmphasisTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests
}

{ #category : #initialization }
TextEmphasisTest >> setUp [
	super setUp.
	prototypes add: TextEmphasis bold;
		 add: TextEmphasis italic;
		 add: TextEmphasis narrow;
		 add: TextEmphasis normal;
		 add: TextEmphasis struckOut;
		 add: TextEmphasis underlined 
]

{ #category : #tests }
TextEmphasisTest >> testAppendString [
	"tests the Text>>prepend: method when appending a String " 
	"self run: # testAppendString"

	| receiver argument result expectedResult |

	receiver := 'xxx' asText  
		addAttribute: TextEmphasis bold from: 1 to: 3.
	argument := 'yyy'.
	expectedResult := 'xxxyyy' asText 
		addAttribute: TextEmphasis bold from: 1 to: 3.
	result := receiver append: argument.
	self assert: (result == receiver). 
	self assert: (result string = expectedResult string).
	self assert: (result runs = expectedResult runs)
]

{ #category : #tests }
TextEmphasisTest >> testAppendText [
	"tests the Text>>prepend: method when appending a Text " 
	| receiver argument result expectedResult |

	receiver := 'xxx' asText  
		addAttribute: TextEmphasis bold from: 1 to: 3.
	argument := 'yyy' asText
		addAttribute: TextEmphasis italic from: 1 to: 3.		.
	expectedResult := 'xxxyyy' asText 
		addAttribute: TextEmphasis bold from: 1 to: 3;
		addAttribute: TextEmphasis italic from: 4 to: 6.
	result := receiver append: argument.
	self assert: (result == receiver). 
	self assert: (result string = expectedResult string).
	self assert: (result runs = expectedResult runs)

	
	
]

{ #category : #tests }
TextEmphasisTest >> testPrependString [
	"tests the Text>>prepend: method when prepending a String " 
	| receiver argument result expectedResult |

	receiver := 'xxx' asText  
		addAttribute: TextEmphasis bold from: 1 to: 3.
	argument := 'yyy'.
	expectedResult := 'yyyxxx' asText 
		addAttribute: TextEmphasis bold from: 4 to: 6.
	result := receiver prepend: argument.
	self assert: (result == receiver). 
	self assert: (result string = expectedResult string).
	self assert: (result runs = expectedResult runs)

	
]

{ #category : #tests }
TextEmphasisTest >> testPrependText [
	"tests the Text>>prepend: method when prepending Text " 
	| receiver argument result expectedResult |

	receiver := 'xxx' asText  
		addAttribute: TextEmphasis bold from: 1 to: 3.
	argument := 'yyy' asText 
		addAttribute: TextEmphasis italic from: 1 to: 3.
	expectedResult := 'yyyxxx' asText 
		addAttribute: TextEmphasis italic from: 1 to: 3;
		addAttribute: TextEmphasis bold from: 4 to: 6.
	result := receiver prepend: argument.
	self assert: (result == receiver). 
	self assert: (result string = expectedResult string).
	self assert: (result runs = expectedResult runs)
]
