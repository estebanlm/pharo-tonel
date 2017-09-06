"
SUnit tests for TextEmphasis
"
Class {
	#name : #TextEmphasisTest,
	#superclass : #HashAndEqualsTestCase,
	#category : #Text-Tests,
	#timestamp : 'TorstenBergmann 1/31/2014 12:23'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextEmphasisTest>>setUp [
	super setUp.
	prototypes add: TextEmphasis bold;
		 add: TextEmphasis italic;
		 add: TextEmphasis narrow;
		 add: TextEmphasis normal;
		 add: TextEmphasis struckOut;
		 add: TextEmphasis underlined 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextEmphasisTest>>testAppendString [
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

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextEmphasisTest>>testAppendText [
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

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextEmphasisTest>>testPrependString [
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

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
TextEmphasisTest>>testPrependText [
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
