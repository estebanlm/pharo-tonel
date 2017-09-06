"
STONArrayWriter helps in writing array based STON representations.

"
Class {
	#name : #STONListWriter,
	#superclass : #STONStreamWriter,
	#category : #STON-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:27'
}
STONListWriter>>add: anObject [
	first ifTrue: [ first := false ] ifFalse: [ writer listElementSeparator ].
	writer nextPut: anObject
]
