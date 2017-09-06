"
A trait for test purposes
"
Trait {
	#name : #TAsStringCommaAndDelimiterTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Collections-Tests-Abstract,
	#timestamp : 'TorstenBergmann 2/20/2014 15:32'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>empty [

	^ self explicitRequirement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>nonEmpty [

	^ self explicitRequirement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>nonEmpty1Element [
" return a collection of size 1 including one element"
	^ self explicitRequirement 
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>test0FixtureAsStringCommaAndDelimiterTest [
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
TAsStringCommaAndDelimiterTest>>testAsCommaStringEmpty [

	self assert: self empty asCommaString = ''.
	self assert: self empty asCommaStringAnd = ''.
	

]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsCommaStringMore [

	| result resultAnd allElementsAsString tmp |
	result:= self nonEmpty asCommaString .
	resultAnd:= self nonEmpty asCommaStringAnd .
	tmp :=OrderedCollection new. 
	self nonEmpty do: [ :each | tmp add: each asString].

	"verifying result  :"
	allElementsAsString := (result findBetweenSubstrings: ', ' ).
	allElementsAsString do:
		[:each |
		self assert: (tmp occurrencesOf: each)=(allElementsAsString occurrencesOf: each).
		].
	
	"verifying esultAnd :"
	allElementsAsString:=(resultAnd findBetweenSubstrings: ', ' ).
	1 to: allElementsAsString size do:
		[:i | 
		i<(allElementsAsString size-1 ) | (i= allElementsAsString size)
			ifTrue: [self assert: (tmp occurrencesOf:(allElementsAsString at:i))=(allElementsAsString  occurrencesOf:(allElementsAsString at:i))].
		i=(allElementsAsString size-1)
			ifTrue:[ self assert: (allElementsAsString at:i)=('and')].
			].
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsCommaStringOne [
	
	self nonEmpty1Element do: 
		[:each | 
		self assert: each asString =self nonEmpty1Element  asCommaString.
		self assert: each asString=self nonEmpty1Element  asCommaStringAnd.].

	
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsStringOnDelimiterEmpty [
	self assert: (String streamContents: [ :emptyStream | self empty asStringOn: emptyStream delimiter: ', ' ]) equals: ''

]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsStringOnDelimiterLastEmpty [
	self assert: (String streamContents: [ :emptyStream | self empty asStringOn: emptyStream delimiter: ', ' last: 'and' ]) equals: ''
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsStringOnDelimiterLastMore [

	| delim multiItemStream result last allElementsAsString tmp |
	
	delim := ', '.
	last := ' and '.
	result:=''.
	tmp := self nonEmpty collect: [:each | each asString].
	multiItemStream := ReadWriteStream on:result.
	self nonEmpty  asStringOn: multiItemStream delimiter: delim last: last.
	result := multiItemStream contents.
	allElementsAsString:=(result findBetweenSubstrings: delim ).
	tmp do:[:each |
		self assert: (tmp occurrencesOf: each) = (allElementsAsString occurrencesOf: each)].
	self assert: ((allElementsAsString at: (allElementsAsString size - 1))=('and'))
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsStringOnDelimiterLastOne [

	| delim oneItemStream result |
	
	delim := ', '.
	result:=''.
	oneItemStream := ReadWriteStream on: result.
	self nonEmpty1Element  asStringOn: oneItemStream delimiter: delim last: 'and'.
	oneItemStream  do:
		[:each1 |
		self nonEmpty1Element do: [:each2 |self assert: each1 = (each2 asString) ]
		 ].
	


]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsStringOnDelimiterMore [

	| delim multiItemStream result allElementsAsString tmp |
	
	
	delim := ', '.
	result:=''.
	tmp:= self nonEmpty collect:[:each | each asString].
	multiItemStream := ReadWriteStream on:result.
	self nonEmpty  asStringOn: multiItemStream delimiter: delim.
	result := multiItemStream contents.
	allElementsAsString := (result findBetweenSubstrings: delim ).
	tmp do:
		[:each |
		self assert: (tmp occurrencesOf: each)=(allElementsAsString occurrencesOf: each).
		].
]

{
	#category : #'tests - as string comma delimiter sequenceable',
	#timestamp : ' 8/31/2017 05:26:28'
}
TAsStringCommaAndDelimiterTest>>testAsStringOnDelimiterOne [

	| delim oneItemStream result |

	delim := ', '.
	result:=''.
	oneItemStream := ReadWriteStream on: result.
	self nonEmpty1Element  asStringOn: oneItemStream delimiter: delim.
	oneItemStream  do:
		[:each1 |
		self nonEmpty1Element do: [:each2 |self assert: each1 = (each2 asString) ]
		 ].
	

]
