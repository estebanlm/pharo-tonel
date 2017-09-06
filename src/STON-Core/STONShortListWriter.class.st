"
STONShortArrayWriter helps in writing short array based STON representations.

"
Class {
	#name : #STONShortListWriter,
	#superclass : #STONListWriter,
	#category : #STON-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONShortListWriter>>add: anObject [
	first ifTrue: [ first := false ] ifFalse: [ writer shortListElementSeparator ].
	writer nextPut: anObject
]
