"

"
Class {
	#name : #ZnResourceMetaUtilsTests,
	#superclass : #TestCase,
	#category : #Zinc-Resource-Meta-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnResourceMetaUtilsTests>>testDecodePercent [
	self assert: (ZnResourceMetaUtils decodePercent: 'foo%20bar') equals: 'foo bar'.
	self should: [ ZnResourceMetaUtils decodePercent: 'foo%%bar' ] raise: ZnCharacterEncodingError 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnResourceMetaUtilsTests>>testQueryParsing [
	| string fields |
	string := 'foo=100&x=', (ZnPercentEncoder new encode: '/a b').
	fields := ZnResourceMetaUtils parseQueryFrom: string readStream.
	self assert: (fields at: 'foo') = '100'.
	self assert: (fields at: 'x') = '/a b'.
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:32'
}
ZnResourceMetaUtilsTests>>testQueryWriting [
	| fields string |
	(fields := Dictionary new)
		at: 'foo' put: '100';
		at: 'bar' put: 'a b'.
	string := String streamContents: [ :stream | 
		ZnResourceMetaUtils writeQueryFields: fields on: stream ].
	self assert: (string includesSubstring: 'foo=1').
	self assert: (string includesSubstring: 'bar=a%20b').
]
