"

"
Class {
	#name : #FFICalloutObjectForTest,
	#superclass : #Object,
	#instVars : [
		'handle'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest class>>asExternalTypeOn: generator [
	^ FFIExternalObjectType objectClass: self
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest class>>primCreate: size [
	self 
		ffiCall: #( FFICalloutObjectForTest malloc( size_t size ) )
		module: LibC	
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest class>>primObject: anObject strcpy: aString [
	self
		ffiCall: #( char *strcpy ( FFICalloutObjectForTest anObject, const char *aString ) )
		module: LibC
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>free [
	handle ifNil: [ ^ self ].
	self primFree
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>handle [
	^ handle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>handle: anObject [
	handle := anObject
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>primFree [
	^ self 
		ffiCall: #( void free ( self ) )
		module: LibC
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>primStrcpy: aString [
	^ self 
		ffiCall: #( char *strcpy ( self, const char *aString ) )
		module: LibC
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>primStrcpy: aString size: n [
	^ self 
		ffiCall: #( char *strncpy ( self, const char *aString, size_t n ) )
		module: LibC
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutObjectForTest>>strcpy: aString [
	handle := ByteArray new: aString size + 1.
	^ self primStrcpy: aString.
]
