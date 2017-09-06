"
AbstractGroup3 is an abstraction of what a group is.
"
Class {
	#name : #Group,
	#superclass : #Object,
	#instVars : [
		'name',
		'readOnly',
		'removable',
		'isFillable'
	],
	#category : #Nautilus-GroupManager,
	#timestamp : 'FranckWarlouzet 7/6/2015 11:03'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group class>>cleanUp [

	self unsubscribeExistingGroups.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group class>>named: aString [

	^ self new name: aString
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group class>>new [
	^ self basicNew initialize
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group class>>unsubscribeExistingGroups [
	"self unsubscribeExistingGroups"
	
	self allSubInstances do: [ :each |  SystemAnnouncer uniqueInstance unsubscribe: each ].
	
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>addClass: aClass [
	"It is for the dropping of a class in a group, do not react"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>beReadOnly [

	readOnly := true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>categoryName [
	"This is the package name set if a class is intended to be created in this group"

	^ '_UnpackagedPackage'
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>classes [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>elements [

	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>hasClassNamed: aClassName [
	^ self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>ifAllowed: aBlock [

	^ self ifAllowed: aBlock ifNot: []
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>ifAllowed: aBlock ifNot: anotherBlock [

	^ self isReadOnly
		ifTrue: anotherBlock
		ifFalse: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>initialize [
	super initialize.
	readOnly := false
		
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>isFillable [

	^ isFillable ifNil: [ isFillable := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>isFillable: aBoolean [

	isFillable := aBoolean
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>isReadOnly [

	^ readOnly == true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>name [

	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>name: aString [

	self ifAllowed: [ name := aString ]
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>packages  [
	^ (self classes 
		collect: #package 
		as: Set)
		asArray
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: ' ( ';
		nextPutAll: self name asString;
		nextPutAll: ' )'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>removable [

	^ removable ifNil: [ removable := true ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>removable: aBoolean [

	removable := aBoolean
]
