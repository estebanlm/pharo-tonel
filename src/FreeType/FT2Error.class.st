"
This is an Error that knows how to get the Freetype2 error code and string.
"
Class {
	#name : #FT2Error,
	#superclass : #Error,
	#instVars : [
		'errorCode',
		'errorString'
	],
	#category : #FreeType-Base,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Error>>errorCode [
	errorCode
		ifNotNil: [^ errorCode].
	^ errorCode := [FT2Library errorCode]
				on: Error
				do: [:ex | ex return: -1]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Error>>errorString [
	errorString
		ifNotNil: [^ errorString].
	^ errorString := [FT2Library errorString]
				on: Error
				do: [:ex | ex return: 'can''t get error string']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:12'
}
FT2Error>>messageText [
	^String streamContents: [ :strm |
		messageText ifNotNil: [ strm nextPutAll: messageText; space ].
		self errorCode isZero ifFalse: [
			strm nextPutAll: '[error '; print: self errorCode; nextPutAll: '][';
				nextPutAll: self errorString;
				nextPut: $] ]]
]
