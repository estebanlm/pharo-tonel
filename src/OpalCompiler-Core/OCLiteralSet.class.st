"
Holds a unique set of literals.  Literal objects are equal if they are #= plus they are the same class.  This set uses this rule for finding elements.

Example:
	Set new add: 'anthony'; add: #anthony; size  ""= 1""
	LiteralSet new add: 'anthony'; add: #anthony; size  ""= 2""

"
Class {
	#name : #OCLiteralSet,
	#superclass : #Set,
	#category : #OpalCompiler-Core-Extras,
	#timestamp : 'ajh 3/25/2003 00:33'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralSet>>add: newObject [
	"Include newObject as one of the receiver's elements.  If equivalent is already present don't add and return equivalent object"

	| index |
	newObject ifNil: [self error: 'Sets cannot meaningfully contain nil as an element'].
	index := self findElementOrNil: newObject.
	^ (array at: index) 
		ifNil: [self atNewIndex: index put: newObject. newObject]
		ifNotNil: [array at: index]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralSet>>scanFor: anObject [
	"Scan the key array for the first slot containing either a nil (indicating an empty slot) or an element that matches anObject. Answer the index of that slot or zero if no slot is found. This method will be overridden in various subclasses that have different interpretations for matching elements."
	| element start finish |
	start := (anObject hash \\ array size) + 1.
	finish := array size.

	"Search from (hash mod size) to the end."
	start to: finish do:
		[:index | ((element := array at: index) isNil
					or: [element literalEqual: anObject])
					ifTrue: [^ index ]].

	"Search from 1 to where we started."
	1 to: start-1 do:
		[:index | ((element := array at: index) isNil
					or: [element literalEqual: anObject])
					ifTrue: [^ index ]].

	^ 0  "No match AND no empty slot"
]
