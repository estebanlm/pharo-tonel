"
RBScanner is a stream that returns a sequence of token from the string that it is created on. The tokens know where they came from in the source code and which comments were attached to them.

Instance Variables:
	buffer	<PositionableStream>	Accumulates the text for the current token.
	characterType	<ByteSymbol>	The type of the next character. (e.g. #alphabetic, etc.)
	classificationTable	<Array of: Symbol>	Mapping from Character values to their characterType.
	comments	<Collection of: Interval>	Source intervals of scanned comments that must be attached to the next token.
	currentCharacter	<Character>	The character currently being processed.
	errorBlock	<BlockClosure>	The block to execute on lexical errors.
	extendedLiterals	<Boolean>	True if IBM-type literals are allowed. In VW, this is false.
	nameSpaceCharacter	<Character>	The character used to separate namespaces.
	numberType	<ByteSymbol>	The method to perform: to scan a number. 
	separatorsInLiterals	<Boolean>	True if separators are allowed within literals.
	stream	<PositionableStream>	Contains the text to be scanned.
	tokenStart	<Integer>	The source position of the beginning of the current token

Class Instance Variables:
	classificationTable	<Array>		the default classification table for all characters

Shared Variables:
	PatternVariableCharacter	<Character>	the character that starts a pattern node
"
Class {
	#name : #RBScanner,
	#superclass : #Object,
	#instVars : [
		'stream',
		'buffer',
		'tokenStart',
		'currentCharacter',
		'characterType',
		'classificationTable',
		'comments',
		'errorBlock'
	],
	#classVars : [
		'CascadePatternCharacter',
		'KeywordPatternCharacter',
		'PatternVariableCharacter'
	],
	#classInstVars : [
		'classificationTable'
	],
	#category : #AST-Core-Parser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>cascadePatternCharacter [
	^ CascadePatternCharacter
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>classificationTable [
	classificationTable 
		ifNil: [ self initializeClassificationTable ].
	^ classificationTable
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>initialize [
	self initializeClassificationTable
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>initializeChars: characters to: aSymbol  [
	characters do: [:c | classificationTable at: c asInteger put: aSymbol]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>initializeClassificationTable [
	PatternVariableCharacter := $`.
	KeywordPatternCharacter := $@.
	CascadePatternCharacter := $;.
	classificationTable := Array new: 255.
	self 
		initializeChars: (Character allCharacters
			select: [ :each | each isLetter ])
		to: #alphabetic.
	self initializeUnderscore.
	self initializeChars: '01234567890' to: #digit.
	self initializeChars: '!%&*+,-/<=>?@\~|' to: #binary.
	classificationTable at: 177 put: #binary.	"plus-or-minus"
	classificationTable at: 183 put: #binary.	"centered dot"
	classificationTable at: 215 put: #binary.	"times"
	classificationTable at: 247 put: #binary.	"divide"
	self initializeChars: '().:;[]{}^' to: #special.
	self
		initializeChars: (Character allCharacters
			select: [ :each | each isSeparator ])
		to: #separator
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>initializeUnderscore [
	self classificationTable
		at: $_ asInteger
		put: #alphabetic
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>isSelector: aSymbol  [
	| scanner token |
	scanner := self basicNew.
	scanner on: (ReadStream on: aSymbol asString).
	scanner step.
	token := scanner scanAnySymbol.
	token isLiteralToken ifFalse: [^false].
	token value isEmpty ifTrue: [^false].
	^scanner atEnd
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>isVariable: aString  [
	| scanner token |
	scanner := self on: (ReadStream on: aString).
	token := scanner next.
	token isIdentifier ifFalse: [^false].
	(token start = 1 and: [token stop = aString size]) ifFalse: [^false].
	^(aString includes: $.) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>keywordPatternCharacter [
	^ KeywordPatternCharacter
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>new [
	self initializeUnderscore.
	^ super new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>on: aStream  [
	| str |
	str := self new on: aStream.
	str
		step;
		stripSeparators.
	^str
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>on: aStream errorBlock: aBlock  [
	| str |
	str := self new on: aStream.
	str
		errorBlock: aBlock;
		step;
		stripSeparators.
	^str
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner class>>patternVariableCharacter [
	^ PatternVariableCharacter
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>atEnd [
	^characterType = #eof
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>classify: aCharacter  [
	| index |
	aCharacter isNil ifTrue: [^nil].
	index := aCharacter asInteger.
	index == 0 ifTrue: [^#separator].
	index > 255 
		ifTrue: 
			[^aCharacter isLetter 
				ifTrue: [#alphabetic]
				ifFalse: [aCharacter isSeparator ifTrue: [#separator] ifFalse: [nil]]].
	^classificationTable at: index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>contents [
	| contentsStream |
	contentsStream := (Array new: 50) writeStream.
	[ self atEnd ]
		whileFalse: [ contentsStream nextPut: self next ].
	^ contentsStream contents
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>errorBlock [
	^errorBlock ifNil: [[:message :position | ]] ifNotNil: [errorBlock]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>errorBlock: aBlock  [
	errorBlock := aBlock
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>errorPosition [
	^stream position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>getComments [
	| oldComments |
	comments isEmpty ifTrue: [^nil].
	oldComments := comments.
	comments := OrderedCollection new: 1.
	^oldComments
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>isReadable [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>isWritable [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>next [
	| token |
	buffer reset.
	tokenStart := stream position.
	token := characterType = #eof 
				ifTrue: 
					[RBToken start: tokenStart + 1	"The EOF token should occur after the end of input"]
				ifFalse: [self scanToken].
	self stripSeparators.
	token comments: self getComments.
	^token
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>nextPut: anObject  [
	"Provide an error notification that the receiver does not
	implement this message."

	self shouldNotImplement
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>on: aStream  [
	buffer := (String new: 60) writeStream.
	stream := aStream.
	classificationTable := self class classificationTable.
	comments := OrderedCollection new
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>parseErrorNode: aMessageString [
	| sourceString |
	sourceString := stream contents copyFrom: self errorPosition to: stream contents size.
	^ RBParseErrorNode
		errorMessage: aMessageString value: sourceString at: self errorPosition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>previousStepPosition [
	^characterType = #eof 
		ifTrue: [stream position]
		ifFalse: [stream position - 1]
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanAnySymbol [
	characterType = #alphabetic ifTrue: [^self scanSymbol].
	characterType = #binary ifTrue: [^self scanBinary: RBLiteralToken].
	^RBToken new
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanBinary: aClass  [
	| val |
	buffer nextPut: currentCharacter.
	self step.
	[ characterType = #binary ] whileTrue: 
		[ buffer nextPut: currentCharacter.
		self step ].
	val := buffer contents.
	val := val asSymbol.
	^aClass value: val start: tokenStart
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanError: theCause [
	| location |
	"error location is the next not parseable character. Or current stream position + 1 if 
	an expected character is missing."
	location := stream position.
	currentCharacter
		ifNotNil: [ :char | buffer nextPut: char ]
		ifNil: [ location := stream position + 1 ].
	^ RBErrorToken
		value: buffer contents asString
		start: tokenStart
		cause: theCause
		location: location
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanIdentifierOrKeyword [
	| name |
	self scanName.
	(currentCharacter = $: and: [stream peek ~= $=]) 
		ifTrue: [^self scanKeyword].
	name := buffer contents.
	name = 'true' 
		ifTrue: 
			[^RBLiteralToken 
				value: true
				start: tokenStart
				stop: self previousStepPosition].
	name = 'false' 
		ifTrue: 
			[^RBLiteralToken 
				value: false
				start: tokenStart
				stop: self previousStepPosition].
	name = 'nil' 
		ifTrue: 
			[^RBLiteralToken 
				value: nil
				start: tokenStart
				stop: self previousStepPosition].
	^RBIdentifierToken value: name start: tokenStart
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanKeyword [
	| outputPosition inputPosition name |
	[currentCharacter = $:] whileTrue: 
			[buffer nextPut: currentCharacter.
			outputPosition := buffer position.
			inputPosition := stream position.
			self step.	":"
			[characterType = #alphabetic] whileTrue: [self scanName]].
	buffer position: outputPosition.
	stream position: inputPosition.
	self step.
	name := buffer contents.
	^(name occurrencesOf: $:) == 1 
		ifTrue: [RBKeywordToken value: name start: tokenStart]
		ifFalse: 
			[RBMultiKeywordLiteralToken 
				value: name asSymbol
				start: tokenStart
				stop: tokenStart + name size - 1]
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanLiteral [
	"Do not allow whitespace between # and the literal."

	"Do not allow number literals after the #"

	self step.
	characterType = #alphabetic
		ifTrue: [ ^ self scanSymbol ].
	characterType = #binary
		ifTrue:
			[ ^ (self scanBinary: RBLiteralToken)
				stop: self previousStepPosition ].
	currentCharacter = $'
		ifTrue: [ ^ self scanStringSymbol ].
	(currentCharacter = $( or: [ currentCharacter = $[ ])
		ifTrue: [ ^ self scanLiteralArrayToken ].
	"Accept multiple #."
	currentCharacter = $#
		ifTrue: [ ^ self scanLiteral ].
	^ self scanError: 'Expecting a literal type'
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanLiteralArrayToken [
	| token |
	token := RBLiteralArrayToken 
				value: (String with: $# with: currentCharacter)
				start: tokenStart.
	self step.
	^token
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanLiteralCharacter [
	| token |
	self step.	"$"
	currentCharacter ifNil:[ ^ self scanError:'A Character was expected'].
	token := RBLiteralToken 
				value: currentCharacter
				start: tokenStart
				stop: stream position.
	self step.	"char"
	^token
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanLiteralString [
	self step.
	
	[currentCharacter isNil 
		ifTrue: [^self scanError: 'Unmatched '' in string literal.' ].
	currentCharacter = $' and: [self step ~= $']] 
			whileFalse: 
				[buffer nextPut: currentCharacter.
				self step].
	^RBLiteralToken 
		value: buffer contents
		start: tokenStart
		stop: self previousStepPosition
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanName [
	[characterType = #alphabetic or: [characterType = #digit]] whileTrue: 
			[buffer nextPut: currentCharacter.
			self step]
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanNumber [
	| start number stop string |
	start := stream position.
	stream position: start - 1.
	number := [NumberParser parse: stream] on: Error do: [:err | self scannerError: err messageText].
	stop := stream position.
	stream position: start - 1.
	string := stream next: stop - start + 1.
	stream position: stop.
	self step.
	^RBNumberLiteralToken 
		value: number
		start: start
		stop: stop
		source: string
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanPatternVariable [
	buffer nextPut: currentCharacter.
	self step.
	currentCharacter = ${ 
		ifTrue: 
			[self step.
			^RBPatternBlockToken value: '`{' start: tokenStart].
	[characterType = #alphabetic] whileFalse: 
			[characterType = #eof 
				ifTrue: [ ^ self scanError: 'Meta variable expected'].
			buffer nextPut: currentCharacter.
			self step].
	^self scanIdentifierOrKeyword
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanSpecialCharacter [
	| character |
	currentCharacter = $: 
		ifTrue: [
			self step.
			^ currentCharacter = $= 
				ifTrue: [
					self step.
					RBAssignmentToken start: tokenStart]
				ifFalse: [ RBSpecialCharacterToken value: $: start: tokenStart ]].
			
	currentCharacter = $_ ifTrue: [ 
		self step.  
		^ RBShortAssignmentToken start: tokenStart ].
	
	character := currentCharacter.
	self step.
	^ RBSpecialCharacterToken value: character start: tokenStart
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanStringSymbol [
	| literalToken |
	literalToken := self scanLiteralString.
	literalToken value: literalToken value asSymbol.
	^literalToken
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanSymbol [
	[ characterType = #alphabetic or: [ currentCharacter = $: ] ] whileTrue: [
		self scanName.
		currentCharacter = $: ifTrue: [
			buffer nextPut: $:.
			self step ] ].
	^ RBLiteralToken 
		value: buffer contents asSymbol
		start: tokenStart
		stop: self previousStepPosition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanToken [
	"fast-n-ugly. Don't write stuff like this. Has been found to cause cancer in laboratory rats. Basically a 
	case statement. Didn't use Dictionary because lookup is pretty slow."

	characterType = #alphabetic ifTrue: [^self scanIdentifierOrKeyword].
	(characterType = #digit 
		or: [currentCharacter = $- and: [(self classify: stream peek) = #digit]]) 
			ifTrue: [^self scanNumber].
	characterType = #binary ifTrue: [^self scanBinary: RBBinarySelectorToken].
	characterType = #special ifTrue: [^self scanSpecialCharacter].
	currentCharacter = $' ifTrue: [^self scanLiteralString].
	currentCharacter = $# ifTrue: [^self scanLiteral].
	currentCharacter = $$ ifTrue: [^self scanLiteralCharacter].
	^self scanUnknownCharacter
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scanUnknownCharacter [
	| errorToken |
	errorToken := self scanError: 'Unknown character'.
	"advance"
	self step.
	^ errorToken
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>scannerError: aString [
	(self errorBlock cull: aString cull: self errorPosition cull: self) ifNil: [ 
		^ SyntaxErrorNotification
					inClass: Object
					withCode: stream contents
					doitFlag: false
					errorMessage: aString
					location: stream position + 1
	]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>step [
	stream atEnd 
		ifTrue: 
			[characterType := #eof.
			^currentCharacter := nil].
	currentCharacter := stream next.
	characterType := self classify: currentCharacter.
	^currentCharacter
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>stripComment [
	| start stop |
	start := stream position.
	self step.
	characterType = #eof
		ifTrue: [ ^ self scannerError: 'Unmatched " in comment.' ].
	[ currentCharacter = $" and: [ self step ~= $" ] ]
		whileFalse: [ characterType = #eof
				ifTrue: [ ^ self scannerError: 'Unmatched " in comment.' ].
			self step ].
	characterType = #eof
		ifTrue: [ stop := stream position ]
		ifFalse: [ stop := stream position - 1 ].
	comments add: (start to: stop)
]

{
	#category : #private-scanning,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBScanner>>stripSeparators [
	
	[[characterType = #separator] whileTrue: [self step].
	currentCharacter = $"] 
			whileTrue: [self stripComment]
]
