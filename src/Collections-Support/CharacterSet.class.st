"
A set of characters.  Lookups for inclusion are very fast.
"
Class {
	#name : #CharacterSet,
	#superclass : #Collection,
	#instVars : [
		'map'
	],
	#classVars : [
		'CrLf'
	],
	#category : #Collections-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet class>>allCharacters [
	"return a set containing all characters"

	| set |
	set := self empty.
	0 to: 255 do: [ :ascii | set add: (Character value: ascii) ].
	^set
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet class>>crlf [
	CrLf ifNil: [CrLf := self with: Character cr with: Character lf].
	^CrLf
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet class>>empty [
 	"return an empty set of characters"
	^self new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet class>>newFrom: aCollection [
	| newCollection |
	newCollection := self new.
	newCollection addAll: aCollection.
	^newCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet class>>nonSeparators [
	"return a set containing everything but the whitespace characters"

	^self separators complement
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet class>>separators [
	"return a set containing just the whitespace characters"

	| set |
	set := self empty.
	set addAll: Character separators.
	^set
]

{
	#category : #comparison,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>= anObject [
	^self species == anObject species and: [
		self byteArrayMap = anObject byteArrayMap ]
]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>add: aCharacter [
	"I automatically become a WideCharacterSet if you add a wide character to myself"
	
	aCharacter asciiValue >= 256
		ifTrue: [| wide |
			wide := WideCharacterSet new.
			wide addAll: self.
			wide add: aCharacter.
			self becomeForward: wide.
			^aCharacter].
	map at: aCharacter asciiValue + 1 put: 1.
	^aCharacter
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>asString [
	"Convert the receiver into a String"

	^String 
		new: self size 
		streamContents: 
			[ :s | self do: [ :ch | s nextPut: ch]].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>byteArrayMap [
	"return a ByteArray mapping each ascii value to a 1 if that ascii value is in the set, and a 0 if it isn't.  Intended for use by primitives only"
	^map
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>byteComplement [
	"return a character set containing precisely the single byte characters the receiver does not"
	
	| set |
	set := CharacterSet allCharacters.
	self do: [ :c | set remove: c ].
	^set
]

{
	#category : #conversion,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>complement [
	"return a character set containing precisely the characters the receiver does not"
	
	^CharacterSetComplement of: self copy
]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>do: aBlock [
	"evaluate aBlock with each character in the set"

	Character allByteCharacters do: [ :c |
		(self includes: c) ifTrue: [ aBlock value: c ] ]

]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>findFirstInByteString: aByteString startingAt: startIndex [
	"Double dispatching: since we know this is a ByteString, we can use a superfast primitive using a ByteArray map with 0 slots for byte characters not included and 1 for byte characters included in the receiver."
	^ByteString
		findFirstInString: aByteString
		inSet: self byteArrayMap
		startingAt: startIndex
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>hasWideCharacters [
	^false
]

{
	#category : #comparison,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>hash [
	^self byteArrayMap hash
]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>includes: aCharacter [
	aCharacter asciiValue >= 256
		ifTrue: ["Guard against wide characters"
			^false].
	^(map at: aCharacter asciiValue + 1) > 0
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>initialize [
	super initialize.
	map := ByteArray new: 256 withAll: 0.
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>postCopy [
	super postCopy.
	map := map copy
]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>remove: aCharacter [
	aCharacter asciiValue >= 256
		ifFalse: ["Guard against wide characters"
			map at: aCharacter asciiValue + 1 put: 0].
	^aCharacter
]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>remove: aCharacter ifAbsent: aBlock [
	(self includes: aCharacter) ifFalse: [^aBlock value].
	^self remove: aCharacter
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>removeAll [

	map atAllPut: 0
]

{
	#category : #'collection ops',
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>size [
	^map sum
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:56'
}
CharacterSet>>wideCharacterMap [
	"used for comparing with WideCharacterSet"
	
	| wide |
	wide := WideCharacterSet new.
	wide addAll: self.
	^wide wideCharacterMap
]
