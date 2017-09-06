"
A mock definition used for testing purposes
"
Class {
	#name : #MCMockDefinition,
	#superclass : #MCDefinition,
	#instVars : [
		'token'
	],
	#category : #Monticello-Mocks,
	#timestamp : 'TorstenBergmann 2/5/2014 13:46'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition class>>token: aString [

	^ self new token: aString
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition class>>wantsChangeSetLogging [
	^ false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>= definition [
	self == definition
		ifTrue: [ ^ true ].
	self species = definition species
		ifFalse: [ ^ false ].
	^definition token = token
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>asString [

	^ token
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>description [

	^ token first
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>hash [

	^ token hash
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>printString [

	^ token
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>summary [

	^ token
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>token [

	^ token
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCMockDefinition>>token: aString [

	token := aString
]
