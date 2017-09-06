"
I define the type for FFITypeArray objects.
"
Class {
	#name : #FFITypeArrayType,
	#superclass : #FFIExternalArrayType,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>annonymousClassCreator [
	^ String streamContents: [ :stream |
		stream 
			nextPutAll: '(FFITypeArray ofType: #';
			print: self objectClass type class;
			nextPutAll: ' size: ';
			print: self objectClass numberOfElements;
			nextPutAll: ')' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>arrayClassName [
	^ self objectClass isAnonymous 
			ifTrue: [ self annonymousClassCreator ]
			ifFalse: [ self objectClass name ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>externalTypeAlignment [
	^ self objectClass type typeAlignment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>externalTypeSize [
	^ self objectClass type typeSize * self objectClass numberOfElements
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>offsetReadArrayAt: offsetVariableName [
	self flag: #todo. "This is not working in all cases for 32/64 bits (
	externalTypeSize could be different)"
	^ String streamContents:[ :stream|
		stream 
			nextPutAll:'^';
			nextPutAll: self arrayClassName;
			nextPutAll:' fromHandle: (handle copyFrom: ';
			nextPutAll: offsetVariableName;
			nextPutAll: ' to: ';
			nextPutAll: (offsetVariableName, ' + ', (self externalTypeSize - 1) asString);
			nextPutAll:')' ].

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>offsetReadFieldAt: offsetVariableName [
	"Return a string defining the accessor to an entity of the receiver type starting at the given byte offset. "
	self isPointer ifTrue: [ ^ super offsetReadFieldAt: offsetVariableName ].
	^ self offsetReadArrayAt: offsetVariableName
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>offsetWriteFieldAt: offsetVariableName with: valueName [
	self flag: #todo. "This is not working in all cases for 32/64 bits (
	externalTypeSize could be different)"
	^ String streamContents:[ :stream|
		stream 
			nextPutAll:'handle replaceFrom: ';
			nextPutAll: offsetVariableName;
			nextPutAll: ' to: ';
			nextPutAll: (offsetVariableName, ' + ', (self externalTypeSize - 1) asString);
			nextPutAll: ' with: anObject getHandle startingAt: 1' ].
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>readArrayAt: byteOffset [
	^ String streamContents:[ :stream|
		stream 
			nextPutAll:'^'. 
		stream nextPutAll: self arrayClassName.
		stream
			nextPutAll:' fromHandle: (handle copyFrom: ';
			print: byteOffset;
			nextPutAll: ' to: ';
			print: byteOffset + self externalTypeSize - 1;
			nextPutAll:')' ].

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>readFieldAt: byteOffset [
	"Return a string defining the accessor to an entity of the receiver type starting at the given byte offset. "
	self isPointer ifTrue: [ ^ super readFieldAt: byteOffset ].
	^ self readArrayAt: byteOffset
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFITypeArrayType>>writeFieldAt: byteOffset with: valueName [
	^ String streamContents:[ :stream|
		stream 
			nextPutAll:'handle replaceFrom: ';
			print: byteOffset;
			nextPutAll: ' to: ';
			print: byteOffset + self externalTypeSize - 1;
			nextPutAll: ' with: anObject getHandle startingAt: 1' ].
]
