"
Holds a unique ordered collection of literals
"
Class {
	#name : #OCLiteralList,
	#superclass : #OrderedCollection,
	#instVars : [
		'equalitySet'
	],
	#category : #OpalCompiler-Core-Extras,
	#timestamp : 'ajh 3/25/2003 00:31'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralList>>addLast: object [
	"Only add if not already in list"

	(equalitySet includes: object) ifTrue: [^ object].
	equalitySet add: object.
	super addLast: object.
	^ object

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralList>>indexOf: anElement startingAt: start ifAbsent: exceptionBlock [

	start to: self size do:
		[:index | ((self at: index) literalEqual: anElement) ifTrue: [^ index]].
	^ exceptionBlock value
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCLiteralList>>setCollection: anArray [

	super setCollection: anArray.
	equalitySet := OCLiteralSet new: anArray size.

]
