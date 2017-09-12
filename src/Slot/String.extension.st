Extension { #name : #String }

{ #category : #'*Slot' }
String >> asClassVariable [
	^ self asSymbol asClassVariable
]

{ #category : #'*Slot' }
String >> asSlot [
	^ self asSymbol asSlot
]

{ #category : #'*Slot' }
String >> asSlotCollection [
	"Parse as slots. Use space, tab and cr as separators
	Example: 
	  'a b' asSlotCollection --> {a => Slot. b => Slot}
	"
	| whitespaces |
	whitespaces := ByteString withAll: { Character space . Character tab . Character cr }.
	^(self substrings: whitespaces) collect: [ :substring | substring asValidInstVarName asSlot ]
]

{ #category : #'*Slot' }
String >> asValidInstVarName [

	| validName |
	
	validName := self select: [ :c | c isAlphaNumeric or: [ c == $_ ] ].
	
	^validName first isDigit 
		ifTrue: [ 'v' , validName ]
		ifFalse: [ validName ]
]

{ #category : #'*Slot' }
String >> inviolateInstanceVariableNames [
	"Answer a list of instance variable names not to be used.  (Place holder for real list)"
	^ #('thisContext' 'self')
]

{ #category : #'*Slot' }
String >> isLegalClassName [
	"Answer whether aString is a legal  class name."

	^ [Smalltalk classInstaller validateClassName: self asSymbol] on: Error do: [^ false] 
]

{ #category : #'*Slot' }
String >> isLegalInstVarName [
	"Answer whether aString is a legal instance variable name."

	^ ((self isLiteralSymbol) and: [(self includes: $:) not]) and:
		[(self inviolateInstanceVariableNames includes:  self) not]
]
