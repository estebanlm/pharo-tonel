"

"
Class {
	#name : #FFIExternalEnumerationTests,
	#superclass : #TestCase,
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>enumClass [
	^ FFITestEnumeration
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>ffiTestCall: enumValue format: format to: buffer [
	^ self 
		ffiCall: #( int sprintf ( ByteArray buffer, String format, FFITestEnumeration enumValue ) )
		module: LibC
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>ffiTestReturn: aNumber format: format to: buffer [
	^ self 
		ffiCall: #( FFITestEnumeration sprintf ( ByteArray buffer, String format, int aNumber ) )
		module: LibC
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>testCall [
	| result buffer |

	buffer := ByteArray new: 100. 
	result := self ffiTestCall: self enumClass DDD format: '%d' to: buffer.
	self assert: result equals: 4.
	self assert: (buffer first: result) asString equals: '2400'	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>testEnumIdents [
	self assert: self enumClass AAA value = 1.
	self assert: self enumClass DDD value = 2400
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>testEnumIncludes [
	self assert: (self enumClass includes: #DDD).
	self deny: (self enumClass includes: #EEE)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>testFromInteger [
	self assert: (self enumClass fromInteger:  1) value = 1 .
	self assert: (self enumClass fromInteger: 2) value = 2.
	self assert: (self enumClass fromInteger: 3) value = 3.
	self assert: (self enumClass fromInteger: 2400) value = 2400.
	self should: [ self enumClass fromInteger: 234 ] raise: Error
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>testNewError [
	self should: [ self enumClass new ] raise: ShouldNotImplement
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalEnumerationTests>>testReturn [
	| result buffer |

	buffer := ByteArray new: 100. 
	result := self ffiTestReturn: 123 format: '%d' to: buffer.
	self assert: result equals: self enumClass CCC.
	self assert: (buffer first: result value) asString equals: '123'	
]
