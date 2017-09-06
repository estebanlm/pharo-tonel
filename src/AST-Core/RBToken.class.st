"
RBToken is the abstract superclass of all of the RB tokens. These tokens (unlike the standard parser's) remember where they came from in the original source code.

Subclasses must implement the following messages:
	accessing
		length

Instance Variables:
	sourcePointer	<Integer>	The position in the original source code where this token began.

"
Class {
	#name : #RBToken,
	#superclass : #Object,
	#instVars : [
		'sourcePointer',
		'comments'
	],
	#category : #AST-Core-Tokens,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken class>>start: anInterval  [
	^self new start: anInterval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>comments [
	^comments
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>comments: anObject [
	comments := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isAssignment [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isBinary [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isError [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isIdentifier [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isKeyword [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isKeywordPattern [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isLiteralArrayToken [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isLiteralToken [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isNumberLiteralToken [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isPatternBlock [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isPatternVariable [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isPrimitiveKeyword [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>isSpecial [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>length [
	^self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>printOn: aStream  [
	aStream
		nextPut: $ ;
		nextPutAll: self class name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>removePositions [
	sourcePointer := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>start [
	^ sourcePointer ifNil: [ 0 ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>start: anInteger  [
	sourcePointer := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
RBToken>>stop [
	^ sourcePointer 
		ifNil: [ -1 ]
		ifNotNil: [ self start + self length - 1 ]
]
