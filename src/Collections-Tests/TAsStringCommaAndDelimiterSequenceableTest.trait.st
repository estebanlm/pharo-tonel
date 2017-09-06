"
A trait for test purposes
"
Trait {
	#name : #TAsStringCommaAndDelimiterSequenceableTest,
	#traits : 'TAsStringCommaAndDelimiterTest',
	#classTraits : 'TAsStringCommaAndDelimiterTest classTrait',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>empty [

	^ self explicitRequirement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>nonEmpty [

	^ self explicitRequirement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>nonEmpty1Element [
" return a collection of size 1 including one element"
	^ self explicitRequirement 
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>test0FixtureAsStringCommaAndDelimiterTest [
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self empty.
	self assert: self empty isEmpty.
	self nonEmpty1Element.
	self assert: self nonEmpty1Element size = 1
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsCommaStringEmpty [

	self assert: self empty asCommaString = ''.
	self assert: self empty asCommaStringAnd = ''.
	

]

{
	#category : #'tests - comma and delimiter',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsCommaStringMore [

	"self assert: self oneTwoThreeItemCol asCommaString = '1, 2, 3'.
	self assert: self oneTwoThreeItemCol asCommaStringAnd = '1, 2 and 3'
"

	| result resultAnd index allElementsAsString |
	result:= self nonEmpty asCommaString .
	resultAnd:= self nonEmpty asCommaStringAnd .
 
	index := 1.
	(result findBetweenSubstrings: ',' )do:
		[:each |
		index = 1
			ifTrue: [self assert: each= ((self nonEmpty at:index)asString)]
			ifFalse: [self assert: each= (' ',(self nonEmpty at:index) asString)].
		index:=index+1
		].
	
	"verifying esultAnd :"
	allElementsAsString:=(resultAnd findBetweenSubstrings: ',' ).
	1 to: allElementsAsString size do:
		[:i | 
		i<(allElementsAsString size )
			ifTrue: [
			i = 1
				ifTrue:[self assert: (allElementsAsString at:i)=((self nonEmpty at:i) asString)]
				ifFalse:[self assert: (allElementsAsString at:i)=(' ',(self nonEmpty at:i) asString)]
				].
		i=(allElementsAsString size)
			ifTrue:[ 
			i = 1
				ifTrue:[self assert: (allElementsAsString at:i)=( (self nonEmpty at:i ) asString ,' and ', (self nonEmpty at: ( i + 1) ) asString )]
				ifFalse:[self assert: (allElementsAsString at:i)=( ' ' , (self nonEmpty at:i ) asString ,' and ', (self nonEmpty at: ( i + 1) ) asString )]
				].
		
		
			].
]

{
	#category : #'tests - comma and delimiter',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsCommaStringOne [
	
	"self assert: self oneItemCol asCommaString = '1'.
	self assert: self oneItemCol asCommaStringAnd = '1'."

	self assert: self nonEmpty1Element  asCommaString = (self nonEmpty1Element first asString).
	self assert: self nonEmpty1Element  asCommaStringAnd = (self nonEmpty1Element first asString).
	
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsStringOnDelimiterEmpty [
	self assert: (String streamContents: [ :emptyStream | self empty asStringOn: emptyStream delimiter: ', ' ]) equals: ''
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsStringOnDelimiterLastEmpty [
	self assert: (String streamContents: [ :emptyStream | self empty asStringOn: emptyStream delimiter: ', ' last: 'and' ]) equals: ''
]

{
	#category : #'tests - comma and delimiter',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsStringOnDelimiterLastMore [

	| delim multiItemStream result last allElementsAsString |
	
	delim := ', '.
	last := ' and '.
	result:=''.
	multiItemStream := ReadWriteStream on:result.
	self nonEmpty  asStringOn: multiItemStream delimiter: delim last: last.
	result := multiItemStream contents.
	allElementsAsString:=(result findBetweenSubstrings: delim ).
	1 to: allElementsAsString size do:
		[:i | 
		i<(allElementsAsString size-1 )
			ifTrue: [self assert: (allElementsAsString at:i)=((self nonEmpty at:i)asString)].
		i=(allElementsAsString size-1)
			ifTrue:[ self deny: (allElementsAsString at:i)=(last)asString].
		i=(allElementsAsString size)
			ifTrue: [self assert: (allElementsAsString at:i)=((self nonEmpty at:(i-1))asString)].
			].
	

]

{
	#category : #'tests - comma and delimiter',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsStringOnDelimiterLastOne [

	| delim oneItemStream result |
	
	delim := ', '.
	result:=''.
	oneItemStream := ReadWriteStream on: result.
	self nonEmpty1Element  asStringOn: oneItemStream delimiter: delim last: 'and'.
	oneItemStream do:[:each | self assert: each = (self nonEmpty1Element first asString)].
	

	
]

{
	#category : #'tests - comma and delimiter',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsStringOnDelimiterMore [

	| delim multiItemStream result index |
	"delim := ', '.
	multiItemStream := '' readWrite.
	self oneTwoThreeItemCol asStringOn: multiItemStream delimiter: ', '.
	self assert: multiItemStream contents = '1, 2, 3'."
	
	delim := ', '.
	result:=''.
	multiItemStream := ReadWriteStream on:result.
	self nonEmpty  asStringOn: multiItemStream delimiter: delim.
	result := multiItemStream contents.
	index:=1.
	(result findBetweenSubstrings: delim )do:
		[:each |
		self assert: each= ((self nonEmpty at:index)asString).
		index:=index+1
		].
]

{
	#category : #'tests - comma and delimiter',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterSequenceableTest>>testAsStringOnDelimiterOne [

	| delim oneItemStream result |
	"delim := ', '.
	oneItemStream := '' readWrite.
	self oneItemCol asStringOn: oneItemStream delimiter: delim.
	self assert: oneItemStream contents = '1'."
	
	delim := ', '.
	result:=''.
	oneItemStream := ReadWriteStream on: result.
	self nonEmpty1Element  asStringOn: oneItemStream delimiter: delim.
	oneItemStream do:[:each | self assert: each = (self nonEmpty1Element first asString)].
	

	
]
