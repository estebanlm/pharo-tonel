"
STONWriterTests test serialization.
"
Class {
	#name : #STONWriterTests,
	#superclass : #TestCase,
	#category : #STON-Tests,
	#timestamp : 'SvenVanCaekenberghe 1/22/2012 20:14'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>serialize: anObject [
	^ String streamContents: [ :stream |
		STON writer 
			on: stream;
			nextPut: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>serializeAsciiOnly: anObject [
	^ String streamContents: [ :stream |
		STON writer 
			on: stream;
			asciiOnly: true;
			nextPut: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>serializeJson: anObject [
	^ String streamContents: [ :stream |
		STON jsonWriter 
			on: stream; 
			nextPut: anObject ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>serializePretty: anObject [
	^ String streamContents: [ :stream |
		STON writer 
			on: stream; 
			prettyPrint: true;
			nextPut: anObject ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testAssociation [
	self assert: (self serialize: 'foo' -> 1) =  '''foo'':1'.
	self assert: (self serialize: #bar -> 2) =  '#bar:2'.
	self assert: (self serialize: 'foo bar' -> #ok) =  '''foo bar'':#ok'.
	self assert: (self serialize: 123 -> 456) =  '123:456'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testBoolean [
	self assert: (self serialize: true) = 'true'.
	self assert: (self serialize: false) = 'false'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testByteArray [
	self assert: (self serialize: #(1 2 3) asByteArray) = 'ByteArray[''010203'']' 

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testClass [
	self assert: (self serialize: Point) = 'Class[#Point]'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testCustomNewline [
	| output |
	output := String streamContents: [ :out |
		(STON writer on: out)
			newLine: String lf;
			prettyPrint: true;
			nextPut: #( 1 ) ].
	self 
		assert: output 
		equals: ('[\	1\]' withCRs replaceAll: Character cr with: Character lf)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testDate [
	| date |
	date := Date year: 2012 month: 1 day: 1.
	self assert: (self serialize: date) = 'Date[''2012-01-01'']'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testDateAndTime [
	| dateAndTime |
	dateAndTime := DateAndTime year: 2012 month: 1 day: 1 hour: 6 minute: 30 second: 15 offset: 1 hour.
	self assert: (self serialize: dateAndTime) = 'DateAndTime[''2012-01-01T06:30:15+01:00'']'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testDictionary [
	| collection |
	collection := STON mapClass new at: 1 put: 1; at: 2 put: 2; yourself.
	self assert: (self serialize: collection) = '{1:1,2:2}'.
	self assert: (self serialize: STON mapClass new) = '{}'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testDictionaryWithComplexKeys [
	| collection |
	collection := STON mapClass new at: true put: 1; at: #(foo) put: 2; yourself.
	self assert: (#('{true:1,[#foo]:2}' '{[#foo]:2,true:1}') includes: (self serialize: collection))
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testDoubleQuotedString [
	| string |
	self assert: (self serializeJson: 'foo') = '"foo"'.
	self assert: (self serializeJson: 'FOO') = '"FOO"'.
	self assert: (self serializeJson: 'élève en Français') = '"élève en Français"'.
	string := String withAll: { 
		$". $'. $\. $/. Character tab. Character cr. Character lf. Character newPage. Character backspace }.
	"Note that in JSON mode, double quotes get escaped, and single quotes not"
	self assert: (self serializeJson: string) equals: '"\"''\\/\t\r\n\f\b"'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testEmptyArrayPretty [
	self assert: (self serializePretty: STON listClass new) equals: '[ ]' 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testEmptyDictionaryPretty [
	self assert: (self serializePretty: STON mapClass new) equals: '{ }' 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testFloat [
	self assert: (self serialize: 1.5) = '1.5'.
	self assert: (self serialize: 0.0) = '0.0'.
	self assert: (self serialize: -1.5) = '-1.5'.
	self assert: ((self serialize: Float pi) beginsWith:  '3.14159').
	self assert: ((self serialize: 1/3) beginsWith:  '0.333').
	self assert: (self serialize: (10 raisedTo: 100) asFloat) = '1.0e100'.
	self assert: (self serialize: (10 raisedTo: -50) asFloat) = '1.0e-50'.
	self assert: (self serialize: (10 raisedTo: -50) asFloat negated) = '-1.0e-50'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testIdentityDictionary [
	| collection |
	collection := IdentityDictionary new at: 1 put: 1; at: 2 put: 2; yourself.
	self assert: (self serialize: collection) = 'IdentityDictionary{1:1,2:2}'.
	self assert: (self serialize: IdentityDictionary new) = 'IdentityDictionary{}'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testInteger [
	self assert: (self serialize: 1) = '1'.
	self assert: (self serialize: 0) = '0'.
	self assert: (self serialize: -1) = '-1'.
	self assert: (self serialize: 1234567890) = '1234567890'.
	self assert: (self serialize: -1234567890) = '-1234567890'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testIsSimpleSymbol [
	self assert: (STON writer isSimpleSymbol: #foo).
	self assert: (STON writer isSimpleSymbol: #az).
	self assert: (STON writer isSimpleSymbol: #AZ).
	self assert: (STON writer isSimpleSymbol: #N0123456789).
	self assert: (STON writer isSimpleSymbol: #foo123).
	self assert: (STON writer isSimpleSymbol: #'Foo/Bar').
	self assert: (STON writer isSimpleSymbol: #'Foo.Bar').
	self assert: (STON writer isSimpleSymbol: #'Foo-Bar').
	self assert: (STON writer isSimpleSymbol: #'Foo_Bar').
	self assert: (STON writer isSimpleSymbol: #foo).
	self deny: (STON writer isSimpleSymbol: #'#^&$%')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testKeepingNewLines [
	| input result output |
	input := 'line ending with CR', String cr, 
		'line ending with LF', String lf, 
		'line ending with CRLF', String crlf.
	output := '''line ending with CR', String crlf, 
		'line ending with LF', String crlf, 
		'line ending with CRLF', String crlf, ''''.
	result := String streamContents: [ :out |
		(STON writer on: out) newLine: String crlf; keepNewLines: true; nextPut: input ].
	self assert: result equals: output.
	output := '''line ending with CR', String cr, 
		'line ending with LF', String cr, 
		'line ending with CRLF', String cr, ''''.
	result := String streamContents: [ :out |
		(STON writer on: out) newLine: String cr; keepNewLines: true; nextPut: input ].
	self assert: result equals: output
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testList [
	self assert: (self serialize: (STON listClass withAll: #(1 2 3))) = '[1,2,3]'.
	self assert: (self serialize: STON listClass new) = '[]'.
	self assert: (self serialize: (STON listClass withAll: { 1. -1. 0. #foo. 'a b c'. true. false. nil })) = '[1,-1,0,#foo,''a b c'',true,false,nil]'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testMap [
	| map |
	(map := STON mapClass new)
		at: #foo put: 1;
		at: #bar put: 2.
	self assert: (self serialize: map) = '{#foo:1,#bar:2}'.
	self assert: (self serialize: STON mapClass new) = '{}'.
	map removeAll.
	map at: 'foo bar' put: #ok.
	self assert: (self serialize: map) = '{''foo bar'':#ok}'.
	map removeAll.
	map at: 123 put: 456.
	self assert: (self serialize: map) = '{123:456}'.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testMetaclass [
	self assert: (self serialize: Point class) = 'Metaclass[#Point]'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testNil [
	self assert: (self serialize: nil) = 'nil'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testNonBMPCharacterEncoding [
	"Characters not in the Basic Multilingual Plane are encoded as a UTF-16 surrogate pair"

	| string json |
	string := String with: 16r1D11E asCharacter. "MUSICAL SYMBOL G CLEF"
	json := String streamContents: [ :out |
		(STON writer on: out) asciiOnly: true; nextPut: string ].
	self assert: json equals: '''\uD834\uDD1E'''
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testNull [
	self assert: (self serializeJson: nil) equals: 'null'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testOrderedCollection [
	| collection |
	collection := OrderedCollection with: 1 with: 2 with: 3.
	self assert: (self serialize: collection) = 'OrderedCollection[1,2,3]'.
	self assert: (self serialize: OrderedCollection new) = 'OrderedCollection[]'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testPoint [
	self assert: (self serialize: 1@2) = 'Point[1,2]'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testReferenceCycle [
	| array |
	array := STON listClass with: 1 with: nil.
	array at: 2 put: array.
	self assert: (self serialize: array) = '[1,@1]'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testReferenceSharing [
	| array one |
	one := { #one }.
	array := STON listClass with: one with: one with: one.
	self assert: (self serialize: array) = '[[#one],@2,@2]'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testReferenceSharingError [
	| serializer array one |
	serializer := [ :object | 
		String streamContents: [ :stream |
			STON writer 
				on: stream;
				referencePolicy: #error; 
				nextPut: object ] ].
	one := { #one }.
	array := STON listClass with: one with: one with: one.
	self 
		should: [ (serializer value: array) = '[[#one],[#one],[#one]]' ] 
		raise: STONWriterError

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testReferenceSharingIgnore [
	| serializer array one |
	serializer := [ :object | 
		String streamContents: [ :stream |
			STON writer 
				on: stream;
				referencePolicy: #ignore; 
				nextPut: object ] ].
	one := { #one }.
	array := STON listClass with: one with: one with: one.
	self assert: (serializer value: array) = '[[#one],[#one],[#one]]'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testRestrictedClassesInJsonMode [
	self should: [ self serializeJson: 1@2 ] raise: STONWriterError.
	self should: [ self serializeJson: #foo->100 ] raise: STONWriterError.
	self should: [ self serializeJson: STONTestUser dummy ] raise: STONWriterError.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testString [
	| string |
	self assert: (self serialize: 'foo') = '''foo'''.
	self assert: (self serialize: 'FOO') = '''FOO'''.
	self assert: (self serializeAsciiOnly: 'élève en Français') = '''\u00E9l\u00E8ve en Fran\u00E7ais'''.
	self assert: (self serialize: 'élève en Français') = '''élève en Français'''.
	string := String withAll: { 
		$". $'. $\. $/. Character tab. Character cr. Character lf.  Character newPage. Character backspace }.
	self assert: (self serialize: string) equals: '''"\''\\/\t\r\n\f\b'''.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testSymbol [
	self assert: (self serialize: #foo) = '#foo'.
	self assert: (self serialize: #FOO) = '#FOO'.
	self assert: (self serialize: #bytes) = '#bytes'.
	self assert: (self serialize: #'foo.bar') = '#foo.bar'.
	self assert: (self serialize: #'foo-bar') = '#foo-bar'.
	self assert: (self serialize: #'foo_bar') = '#foo_bar'.
	self assert: (self serialize: #'foo/bar') = '#foo/bar'.
	self assert: (self serialize: #'foo bar') = '#''foo bar'''.
	self assert: (self serialize: #foo123) = '#foo123'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testSymbolAsString [
	self assert: (self serializeJson: #foo) = '"foo"'.
	self assert: (self serializeJson: #'FOO') = '"FOO"'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testTime [
	| time |
	time := Time hour: 6 minute: 30 second: 15.
	self assert: (self serialize: time) equals: 'Time[''06:30:15'']'.
	time := Time hour: 6 minute: 30 second: 15 nanoSecond: 123.
	self assert: (self serialize: time) equals: 'Time[''06:30:15.000000123'']'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testUser [
	| user |
	(user := STONTestUser new)
		username: 'john@foo.com';
		password: 'secret1'.
	self 
		assert: (self serialize: user)
		equals: 'TestUser{#username:''john@foo.com'',#password:''secret1'',#enabled:true}'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testUser2 [
	| user |
	(user := STONTestUser2 new)
		username: 'john@foo.com';
		password: 'secret1'.
	self 
		assert: (self serialize: user)
		equals: 'TestUser2{#username:''john@foo.com'',#password:''secret1'',#enabled:true}'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testUser3Nil [
	| user |
	user := STONTestUser3 new.
	self 
		assert: (self serialize: user) 
		equals: 'TestUser3{#username:nil,#password:nil,#enabled:true}'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
STONWriterTests>>testUserNil [
	| user |
	user := STONTestUser new.
	self assert: (self serialize: user) equals: 'TestUser{#enabled:true}'
]
