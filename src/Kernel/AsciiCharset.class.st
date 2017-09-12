"
Notify to abort a task
"
Class {
	#name : #AsciiCharset,
	#superclass : #Object,
	#category : #Kernel-BasicObjects
}

{ #category : #testing }
AsciiCharset class >> canBeGlobalVarInitial: aCharacter [ 
	
	^ self isUppercase: aCharacter
]

{ #category : #casing }
AsciiCharset class >> isDigit: aCharacter [

	^ aCharacter between: $0 and: $9
]

{ #category : #casing }
AsciiCharset class >> isLetter: aCharacter [

	^ (aCharacter between: $a and: $z)
		or: [ (aCharacter between: $A and: $Z) ]	
]

{ #category : #casing }
AsciiCharset class >> isLowercase: aCharacter [

	^ (aCharacter between: $a and: $z)
]

{ #category : #casing }
AsciiCharset class >> isUppercase: aCharacter [

	^ (aCharacter between: $A and: $Z)
]

{ #category : #casing }
AsciiCharset class >> toLowercase: aCharacter [
	"(AsciiCharset new toLowercase: $A) >>> $a.
	(AsciiCharset new toLowercase: $a) >>> $a.
	(AsciiCharset new toLowercase: $!) >>> $!"
	(aCharacter between: $A and: $Z)
		ifFalse: [ ^ aCharacter ].
	
	^ Character value: (aCharacter asciiValue + $a asInteger - $A asInteger )
]

{ #category : #casing }
AsciiCharset class >> toUppercase: aCharacter [
	"(AsciiCharset new toUppercase: $a) >>> $A.
	(AsciiCharset new toUppercase: $A) >>> $A.
	(AsciiCharset new toUppercase: $!) >>> $!"
	(aCharacter between: $a and: $z)
		ifFalse: [ ^ aCharacter ].
	
	^ Character value: (aCharacter asciiValue - $a asInteger + $A asInteger )
]
