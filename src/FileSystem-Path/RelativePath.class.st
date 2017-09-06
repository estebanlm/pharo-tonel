"
I represent a relative path (a position starting from Path workingDirectory)
"
Class {
	#name : #RelativePath,
	#superclass : #Path,
	#type : #variable,
	#category : #FileSystem-Path,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:38'
}
RelativePath>>isAbsolute [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:38'
}
RelativePath>>isRoot [
	^ false
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:38'
}
RelativePath>>printOn: aStream [
	aStream nextPutAll: 'Path '.
	self isWorkingDirectory
		ifTrue: [aStream nextPutAll: 'workingDirectory']
		ifFalse: 
			[aStream 
				nextPutAll: '* ''';
				nextPutAll: (self at: 1) asString;
				nextPut: $'.
			2 to: self size do:
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
RelativePath>>printOn: aStream delimiter: aCharacter [
	self isWorkingDirectory ifTrue: [aStream nextPut: $.. ^ self].
	super printOn: aStream delimiter: aCharacter
]
