"
-- Regular Expression Matcher v 1.1 (C) 1996, 1999 Vassili Bykov
--
This represents a character that satisfies a certain predicate.

Instance Variables:

	predicate	<BlockClosure>	A one-argument block. If it evaluates to the value defined by <negated> when it is passed a character, the predicate is considered to match.
	negation	<BlockClosure>	A one-argument block that is a negation of <predicate>.
"
Class {
	#name : #RxsPredicate,
	#superclass : #RxsNode,
	#instVars : [
		'predicate',
		'negation'
	],
	#classVars : [
		'EscapedLetterSelectors',
		'NamedClassSelectors'
	],
	#category : #Regex-Core,
	#timestamp : 'Tbn 11/12/2010 23:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate class>>forEscapedLetter: aCharacter [

	^self new perform:
		(EscapedLetterSelectors
			at: aCharacter
			ifAbsent: [RxParser signalSyntaxException: 'bad backslash escape'])
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate class>>forNamedClass: aString [

	^self new perform:
		(NamedClassSelectors
			at: aString
			ifAbsent: [RxParser signalSyntaxException: 'bad character class name'])
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate class>>initialize [
	"self initialize"

	self
		initializeNamedClassSelectors;
		initializeEscapedLetterSelectors
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate class>>initializeEscapedLetterSelectors [
	"self initializeEscapedLetterSelectors"

	(EscapedLetterSelectors := Dictionary new)
		at: $w put: #beWordConstituent;
		at: $W put: #beNotWordConstituent;
		at: $d put: #beDigit;
		at: $D put: #beNotDigit;
		at: $s put: #beSpace;
		at: $S put: #beNotSpace;
		at: $\ put: #beBackslash
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate class>>initializeNamedClassSelectors [
	"self initializeNamedClassSelectors"

	(NamedClassSelectors := Dictionary new)
		at: 'alnum' put: #beAlphaNumeric;
		at: 'alpha' put: #beAlphabetic;
		at: 'cntrl' put: #beControl;
		at: 'digit' put: #beDigit;
		at: 'graph' put: #beGraphics;
		at: 'lower' put: #beLowercase;
		at: 'print' put: #bePrintable;
		at: 'punct' put: #bePunctuation;
		at: 'space' put: #beSpace;
		at: 'upper' put: #beUppercase;
		at: 'xdigit' put: #beHexDigit
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beAlphaNumeric [

	predicate := [:char | char isAlphaNumeric].
	negation := [:char | char isAlphaNumeric not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beAlphabetic [

	predicate := [:char | char isLetter].
	negation := [:char | char isLetter not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beBackslash [

	predicate := [:char | char == $\].
	negation := [:char | char ~~ $\]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beControl [

	predicate := [:char | char asInteger < 32].
	negation := [:char | char asInteger >= 32]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beDigit [

	predicate := [:char | char isDigit].
	negation := [:char | char isDigit not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beGraphics [

	self
		beControl;
		negate
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beHexDigit [

	| hexLetters |
	hexLetters := 'abcdefABCDEF'.
	predicate := [:char | char isDigit or: [hexLetters includes: char]].
	negation := [:char | char isDigit not and: [(hexLetters includes: char) not]]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beLowercase [

	predicate := [:char | char isLowercase].
	negation := [:char | char isLowercase not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beNotDigit [

	self
		beDigit;
		negate
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beNotSpace [

	self
		beSpace;
		negate
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beNotWordConstituent [

	self
		beWordConstituent;
		negate
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>bePrintable [

	self
		beControl;
		negate
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>bePunctuation [

	| punctuationChars |
	punctuationChars := #($. $, $! $? $; $: $" $' $- $( $) $`).
	predicate := [:char | punctuationChars includes: char].
	negation := [:char | (punctuationChars includes: char) not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beSpace [

	predicate := [:char | char isSeparator].
	negation := [:char | char isSeparator not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beUppercase [

	predicate := [:char | char isUppercase].
	negation := [:char | char isUppercase not]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>beWordConstituent [

	predicate := [:char | char isAlphaNumeric or: [char == $_]].
	negation := [:char | char isAlphaNumeric not and: [char ~~ $_]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>dispatchTo: anObject [

	^anObject syntaxPredicate: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>isEnumerable [

	^false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>negate [

	| tmp |
	tmp := predicate.
	predicate := negation.
	negation := tmp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>negated [

	^self copy negate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>predicate [

	^predicate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>predicateNegation [

	^negation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
RxsPredicate>>value: aCharacter [

	^predicate value: aCharacter
]
