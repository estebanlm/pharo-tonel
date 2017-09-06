"
Read a Date from the stream based on the pattern which can include the tokens:
	
		y = A year with 1 to n digits (after 2000)
		yy = A year with 2 digits (after 2000)
		yyyy = A year with 4 digits
		m = A month with 1 or 2 digits
		mm = A month with 2 digits
		d = A day with 1 or 2 digits
		dd = A day with 2 digits
		
	...and any other Strings inbetween. Representing $y, $m and $d is done using
	\y, \m and \d and slash itself with \\. Simple example patterns:

		'yyyy-mm-dd'
		'yyyymmdd'
		'yy.mm.dd'
		'y-m-d'
"
Class {
	#name : #DateParser,
	#superclass : #Object,
	#instVars : [
		'inputStream',
		'pattern',
		'patternStream',
		'char',
		'year',
		'month',
		'day',
		'invalidPattern'
	],
	#category : #Kernel-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser class>>readingFrom: anInputStream pattern: aPattern [

	"See class comment for pattern description
	self comment"
	
	^self new initializeReadingFrom: anInputStream pattern: aPattern


]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>convertTwoDigitsYear [

	(year between: 0 and: 99) ifTrue: [ year := self currentMillenium + year ]
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>createDate [

	^ Date year: year month: month day: day
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>currentMillenium [
	^ (Date current year / 100) asInteger * 100
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>initializeParsing [

	invalidPattern := false.
	patternStream := pattern readStream
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>initializeReadingFrom: anInputStream pattern: aPattern [

	inputStream := anInputStream.
	pattern := aPattern.
	
]

{
	#category : #'parsing day - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isDayPattern [

	^ char = $d
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isDoneParsing [

	^ patternStream atEnd or: [ inputStream atEnd or: [  invalidPattern  ]]
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isEscape [

	^ char = $\
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isFourDigitYearPattern [

	^ patternStream nextMatchAll: 'yyy'
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isInvalidPattern [

	^ year isNil or: [ month isNil or: [ day isNil or: [ invalidPattern ]]]
]

{
	#category : #'parsing month - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isMonthPattern [

	^ char = $m
]

{
	#category : #'parsing day - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isTwoDigitDayPattern [

	^ patternStream peekFor: $d
]

{
	#category : #'parsing month - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isTwoDigitMonthPattern [

	^ patternStream peekFor: $m
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isTwoDigitYearPattern [

	^ patternStream peekFor: $y
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>isYearPattern [

	^ char = $y
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parse [
	^ self parseIfError: [ DateError signal ]
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parse: aTimeUnitName [
	^ Integer readFrom: inputStream ifFail: [ DateError signal: 'Expecting a ',aTimeUnitName ]
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parse: timeUnitName expectedSize: anInteger [
	| extractedString result |
	extractedString := inputStream next: anInteger.
	result := extractedString asInteger.
	(result isNil or: [ extractedString size ~= anInteger ]) 
		ifTrue: [ DateError signal: ' Expect a two digit ', timeUnitName, ', got ', extractedString ].
	^ result
]

{
	#category : #'parsing day - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseDay [

	self isTwoDigitDayPattern ifTrue: [ ^ self parseTwoDigitDay ].
	self parseVariableDigitDay
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseEscapePattern [

	inputStream next = patternStream next ifFalse: [ invalidPattern := true ]
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseFourDigitYear [

	year := self parse: 'year' expectedSize: 4
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseIfError: aBlock [
	"Parse the date according to the given pattern"
	self initializeParsing.
	
	[ self isDoneParsing ] whileFalse: [ self parseNextPattern ].

	self isInvalidPattern ifTrue: aBlock.
	self convertTwoDigitsYear.
	
	(inputStream atEnd and: [ patternStream atEnd ]) ifFalse: [ DateError signal: 'Input doesn''t match given pattern.' ].
	
	^ self createDate
]

{
	#category : #'parsing month - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseMonth [

	self isTwoDigitMonthPattern ifTrue: [ ^self parseTwoDigitMonth ].
	self parseVariableDigitMonth 
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseNextPattern [

	self readNextChar.

	self isEscape ifTrue: [ ^ self parseEscapePattern ].
	self isYearPattern ifTrue: [ ^ self parseYear ].
	self isMonthPattern ifTrue: [ ^ self parseMonth ].
	self isDayPattern ifTrue: [ ^ self parseDay ].
	
	self parseSameChar
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseSameChar [

	inputStream next = char ifFalse: [ invalidPattern := true ]
]

{
	#category : #'parsing day - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseTwoDigitDay [
	day := self parse: 'day' expectedSize: 2
]

{
	#category : #'parsing month - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseTwoDigitMonth [

	month := self parse: 'month' expectedSize: 2
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseTwoDigitYear [

	year := self parse: 'year' expectedSize: 2
]

{
	#category : #'parsing day - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseVariableDigitDay [

	day := self parse: 'day'
]

{
	#category : #'parsing month - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseVariableDigitMonth [

	month := self parse: 'month'
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseVariableDigitYear [

	year := self parse: 'year'
]

{
	#category : #'parsing year - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>parseYear [

	self isFourDigitYearPattern ifTrue: [ ^ self parseFourDigitYear ].
	self isTwoDigitYearPattern ifTrue: [ ^ self parseTwoDigitYear ].
	self parseVariableDigitYear
]

{
	#category : #'parsing - private',
	#timestamp : ' 8/31/2017 07:16:33'
}
DateParser>>readNextChar [

	char := patternStream next
]
