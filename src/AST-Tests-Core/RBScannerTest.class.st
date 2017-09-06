"
SUnit tests for RBScanner
"
Class {
	#name : #RBScannerTest,
	#superclass : #TestCase,
	#category : #AST-Tests-Core,
	#timestamp : 'TorstenBergmann 2/4/2014 21:53'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>buildScannerForText: source [
	^RBScanner on: (ReadStream on: source)
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextLiteralCharacterWithAMissingCharacter [
	| source scanner scannedToken |
	source := '$'.
	scanner := self buildScannerForText: source.
	scannedToken := scanner next.
	self verifyErrorToken: scannedToken message: 'A Character was expected' translated valueExpected: ''

]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithAWrongSymbolGetError [
	| source scanner scannedToken |
	source := '#^'.
	scanner := self buildScannerForText: source.
	scannedToken := scanner next.
	self verifyErrorToken: scannedToken message: 'Expecting a literal type' translated valueExpected: '^'
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithAnIdentifierTokenGetTheIdentifierToken [
	| source scanner token |
	
	source := 'identifierToken'.
	scanner := self buildScannerForText: source.
	token := scanner next.
	self assert: token isIdentifier.
	self deny: token isError.
	self assert: token value equals: source.
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithAnOpeningCommentAtEndGetError [
	| source |
	
	source := 'self "'.
	self should: [(self buildScannerForText: source) next] raise: SyntaxErrorNotification
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithAnOpeningCommentGetError [
	| source |
	
	source := '"only the opening'.
	self should: [(self buildScannerForText: source) next] raise: SyntaxErrorNotification
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithAnOpeningStringsGetError [
	| source scannedToken |
	source := '''only the opening'.
	scannedToken := (self buildScannerForText: source) next.
	self verifyErrorToken: scannedToken message: 'Unmatched '' in string literal.' translated valueExpected: 'only the opening'
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithAnUnknownCharacterGetError [
	| source scanner scannedToken |
	
	source := '¿'.
	scanner := self buildScannerForText: source.
	scannedToken := scanner next.
	self verifyErrorToken: scannedToken message: 'Unknown character' translated valueExpected: source
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithTwoDoubleQuotesInComment [
	| source scanner token |
	source := '"only the"" opening"'.
	self
		shouldnt: [ token := (scanner := self buildScannerForText: source) next ]
		raise: SyntaxErrorNotification.
	self assert: token comments first = (1 to: source size)
]

{
	#category : #next,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>testNextWithTwoDoubleQuotesInCommentGetError [
	| source scanner token |
	source := '"only the"" opening'.
	self
		should: [ token := (scanner := self buildScannerForText: source) next ]
		raise: SyntaxErrorNotification
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RBScannerTest>>verifyErrorToken: scannedToken message: message valueExpected: valueExpected [
	self assert: scannedToken isError.
	self assert: scannedToken cause equals: message.
	self assert: scannedToken value equals: valueExpected.
	self assert: scannedToken start equals: 1.
]
