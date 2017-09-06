"

"
Class {
	#name : #MetacelloMemberSpec,
	#superclass : #MetacelloSpec,
	#instVars : [
		'name',
		'spec'
	],
	#category : #Metacello-Core-Members,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>applyAdd: addBlock copy: copyBlock merge: mergeBlock remove: removeBlock [

	self subclassResponsibility
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>applyToList: aListSpec [

	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>configMethodCascadeOn: aStream last: lastCascade indent: indent [

	self spec 
		configMethodCascadeOn: aStream 
		member: self 
		last: lastCascade 
		indent: indent
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>configMethodOn: aStream indent: indent [

	aStream nextPutAll: self class name asString, ' member: ('.
	self spec configMethodOn: aStream indent: indent.
	aStream nextPutAll: ')'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>methodUpdateSelector [

	^self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>name [

	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>name: aString [

	name := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>sourceName [

	^self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>spec [

	^spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloMemberSpec>>spec: aMetacelloSpec [

	spec := aMetacelloSpec
]
