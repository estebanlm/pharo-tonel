"
This class represents the domestic character encoding called ISO-8859-1, also known as Latin-1 used for Most of the Western European Languages.
"
Class {
	#name : #Latin1,
	#superclass : #EncodedCharSet,
	#classInstVars : [
		'rightHalfSequence'
	],
	#category : #Multilingual-Encodings
}

{ #category : #'class methods' }
Latin1 class >> emitSequenceToResetStateIfNeededOn: aStream forState: state [ 
	state g0Leading ~= 0 ifTrue: 
		[ state charSize: 1.
		state g0Leading: 0.
		state g0Size: 1.
		aStream basicNextPutAll: compoundTextSequence ]

	"Actually, G1 state should go back to ISO-8859-1, too."
]

{ #category : #'class methods' }
Latin1 class >> initialize [
	"
	self initialize
"
	self initializeUcsTable.
	compoundTextSequence := String streamContents: 
		[ :s | 
		s nextPut: (Character value: 27).
		s nextPut: $(.
		s nextPut: $B ].
	rightHalfSequence := String streamContents: 
		[ :s | 
		s nextPut: (Character value: 27).
		s nextPut: $-.
		s nextPut: $A ]
]

{ #category : #'class methods' }
Latin1 class >> initializeUcsTable [
	UcsTable := (0 to: 255) asArray.
]

{ #category : #'accessing - displaying' }
Latin1 class >> isBreakableAt: index [ in: text

	| char |
	char := text at: index.
	char = Character space ifTrue: [^ true].
	char = Character cr ifTrue: [^ true].
	char = Character lf ifTrue: [^ true].
	^ false.

]

{ #category : #'character classification' }
Latin1 class >> isLetter: char [
	"Answer whether the receiver is a letter."

	^ Unicode isLetter: char.


]

{ #category : #'class methods' }
Latin1 class >> leadingChar [

	^ 0.

]

{ #category : #private }
Latin1 class >> nextPutRightHalfValue: ascii toStream: aStream withShiftSequenceIfNeededForTextConverterState: state [ 
	state charSize: 1.
	state g1Leading: 0.
	state g1Size: 1.
	aStream basicNextPutAll: rightHalfSequence.
	aStream basicNextPut: (Character value: ascii)
]

{ #category : #'class methods' }
Latin1 class >> nextPutValue: ascii toStream: aStream withShiftSequenceIfNeededForTextConverterState: state [ 
	(ascii <= 127 and: [ state g0Leading ~= 0 ]) ifTrue: 
		[ state charSize: 1.
		state g0Leading: 0.
		state g0Size: 1.
		aStream basicNextPutAll: compoundTextSequence.
		aStream basicNextPut: (Character value: ascii).
		^ self ].
	((128 <= ascii and: [ ascii <= 255 ]) and: [ state g1Leading ~= 0 ]) ifTrue: 
		[ ^ self 
			nextPutRightHalfValue: ascii
			toStream: aStream
			withShiftSequenceIfNeededForTextConverterState: state ].
	aStream basicNextPut: (Character value: ascii).
	^ self
]

{ #category : #'accessing - displaying' }
Latin1 class >> printingDirection [

	^ #right.

]
