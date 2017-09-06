"

"
Class {
	#name : #MetacelloValueHolderSpec,
	#superclass : #MetacelloSpec,
	#instVars : [
		'value'
	],
	#category : #Metacello-Core-Specs,
	#timestamp : ''
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>configMethodOn: aStream indent: indent [

	aStream tab: indent; nextPutAll: 'spec value: ', self value printString
]

{
	#category : #merging,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>mergeMap [

	| map |
	map := super mergeMap.
	map at: #value put: value.
	^map
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>setAuthorInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setAuthor: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>setBlessingInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setBlessing: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>setDescriptionInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setDescription: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>setPostLoadDoItInMetacelloSpec: aMetacelloSpec [

	aMetacelloSpec setPostLoadDoIt: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>setPreLoadDoItInMetacelloSpec: aMetacelloSpec [

	aMetacelloSpec setPreLoadDoIt: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>setTimestampInMetacelloVersion: aMetacelloVersionSpec [

	aMetacelloVersionSpec setTimestamp: self
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>value [
	^ value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>value: anObject [
	value := anObject
]

{
	#category : #construction,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloValueHolderSpec>>value: anObject constructor: aVersionConstructor [
    aVersionConstructor valueForValueHolder: anObject
]
