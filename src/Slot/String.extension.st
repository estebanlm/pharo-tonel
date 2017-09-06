Extension {
	#name : #String
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>asClassVariable [
	^ self asSymbol asClassVariable
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>asSlot [
	^ self asSymbol asSlot
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>asSlotCollection [
	"Parse as slots. Use space, tab and cr as separators
	Example: 
	  'a b' asSlotCollection --> {a => Slot. b => Slot}
	"
	| whitespaces |
	whitespaces := ByteString withAll: { Character space . Character tab . Character cr }.
	^(self substrings: whitespaces) collect: [ :substring | substring asValidInstVarName asSlot ]
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>asValidInstVarName [

	| validName |
	
	validName := self select: [ :c | c isAlphaNumeric or: [ c == $_ ] ].
	
	^validName first isDigit 
		ifTrue: [ 'v' , validName ]
		ifFalse: [ validName ]
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>inviolateInstanceVariableNames [
	"Answer a list of instance variable names not to be used.  (Place holder for real list)"
	^ #('thisContext' 'self')
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>isLegalClassName [
	"Answer whether aString is a legal  class name."

	^ [Smalltalk classInstaller validateClassName: self asSymbol] on: Error do: [^ false] 
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
String>>isLegalInstVarName [
	"Answer whether aString is a legal instance variable name."

	^ ((self isLiteralSymbol) and: [(self includes: $:) not]) and:
		[(self inviolateInstanceVariableNames includes:  self) not]
]
