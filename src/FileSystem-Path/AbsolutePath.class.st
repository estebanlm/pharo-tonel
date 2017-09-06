"
I represent an absolute path (a position starting from Path root)
"
Class {
	#name : #AbsolutePath,
	#superclass : #Path,
	#type : #variable,
	#category : #FileSystem-Path,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath class>>addEmptyElementTo: result [

]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath class>>from: aString delimiter: aDelimiterCharater [
	aString = '/'
		ifTrue: [ ^ self root ].
		
	^ super from: aString delimiter: aDelimiterCharater
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath>>isAbsolute [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath>>isRoot [
	^ self size = 0
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath>>printOn: aStream [
	aStream nextPutAll: 'Path'.
	self isRoot
		ifTrue: [aStream nextPutAll: ' root']
		ifFalse:
			[1 to: self size do:
				[:i |
				aStream 
					nextPutAll: ' / ''';
				 	nextPutAll: (self at: i);
					nextPut: $']]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath>>printPathOn: aStream delimiter: aCharacter [
	"Print the path elements of the receiver, without the 'Path *' part"

	aStream nextPut: aCharacter.
	super printPathOn: aStream delimiter: aCharacter

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:38'
}
AbsolutePath>>withParents [
	^ super withParents addFirst: (Path root); yourself
]
