"
I keep track of the current and high position of the stack that will be needed by code being compiled.
"
Class {
	#name : #ParseStack,
	#superclass : #Object,
	#instVars : [
		'position',
		'length'
	],
	#category : #Compiler-Support,
	#timestamp : '<historical>'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>init [

	length := position := 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>pop: n [

	(position := position - n) < 0 
		ifTrue: [self error: 'Parse stack underflow']
]

{
	#category : #results,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>position [

	^position
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>position: n  [
	(position := n) > length
		ifTrue: [length := position]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>printOn: aStream [
	
	super printOn: aStream.
	aStream nextPutAll: ' at '; print: position; nextPutAll: ' of '; print: length
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>push: n [

	(position := position + n) > length 
		ifTrue: [length := position]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:32'
}
ParseStack>>size [

	^length
]
