"
Notify to abort a task
"
Class {
	#name : #AsciiCharset,
	#superclass : #Object,
	#category : #Kernel-BasicObjects,
	#timestamp : 'GuillermoPolito 19/07/2017 17:02'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>canBeGlobalVarInitial: aCharacter  [
	
	^ self isUppercase: aCharacter
]

{
	#category : #casing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>isDigit: aCharacter [

	^ aCharacter between: $0 and: $9
]

{
	#category : #casing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>isLetter: aCharacter [

	^ (aCharacter between: $a and: $z)
		or: [ (aCharacter between: $A and: $Z) ]	
]

{
	#category : #casing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>isLowercase: aCharacter [

	^ (aCharacter between: $a and: $z)
]

{
	#category : #casing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>isUppercase: aCharacter [

	^ (aCharacter between: $A and: $Z)
]

{
	#category : #casing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>toLowercase: aCharacter [
	"(AsciiCharset new toLowercase: $A) >>> $a.
	(AsciiCharset new toLowercase: $a) >>> $a.
	(AsciiCharset new toLowercase: $!) >>> $!"
	(aCharacter between: $A and: $Z)
		ifFalse: [ ^ aCharacter ].
	
	^ Character value: (aCharacter asciiValue + $a asInteger - $A asInteger )
]

{
	#category : #casing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AsciiCharset class>>toUppercase: aCharacter [
	"(AsciiCharset new toUppercase: $a) >>> $A.
	(AsciiCharset new toUppercase: $A) >>> $A.
	(AsciiCharset new toUppercase: $!) >>> $!"
	(aCharacter between: $a and: $z)
		ifFalse: [ ^ aCharacter ].
	
	^ Character value: (aCharacter asciiValue - $a asInteger + $A asInteger )
]
