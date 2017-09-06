"
RGClassDescriptionDefinition is the common parent for classes and metaclasses defining instance variables
"
Class {
	#name : #RGClassDescriptionDefinition,
	#superclass : #RGBehaviorDefinition,
	#instVars : [
		'instanceVariables',
		'organization'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 4/19/2011 16:00'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>= aRGClassDefinition [

	^self class = aRGClassDefinition class 
		and: [ self name = aRGClassDefinition name 
			and: [ self environment = aRGClassDefinition environment ] ]
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>addInstVarNamed: aString [
	| var |
	var := ((self isMeta 
				ifTrue: [ RGClassInstanceVariableDefinition ]
				ifFalse:[  RGInstanceVariableDefinition ])
		named: aString) parent: self.
	self addVariable: var in: instanceVariables.
	^var
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>addInstanceVariable: aRGVariableDefinition [
	"aRGVariableDefinition is a instance variable or class instance variable"

	self addVariable: (aRGVariableDefinition parent: self)
		in: instanceVariables
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>addInstanceVariables: aCollection [
	
	aCollection do: [:var | self addInstVarNamed: var ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>addVariable: aRGVariableDefinition in: aCollection [
	"Adds a RGVariableDefinition in the collection received" 

	aCollection add: aRGVariableDefinition
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>allInstVarNames [

	^self allInstanceVariables collect:[ :ivar| ivar name ]
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>allInstanceVariables [
	"Answer a collection of the receiver's instanceVariables, including those defined in its superclass"

	^self hasSuperclass 
		ifFalse:[ instanceVariables ]
		ifTrue:[ self superclass allInstanceVariables, instanceVariables ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>hash [

	^self name hash bitXor: self class hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>initialize [

	super initialize.
	instanceVariables:= OrderedCollection new.
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>instVarNames [
	"Answer a collection of the names of the instance variables defined in the receiver."
	
	^instanceVariables collect:[ :ivar| ivar name ]
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>instanceVariableNamed: aString [
	^ instanceVariables 
		detect: [ :v | v name = aString asSymbol ] 
		ifNone: [ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>instanceVariables [

	^instanceVariables
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>instanceVariables: aCollection [

	instanceVariables:= aCollection
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>isClass [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>isSameRevisionAs: aRGClassDescriptionDefinition [
	"This method look for equality of the properties of the receiver"
	"Instances variables are compared at the level of names but without any sorting"

	^(super isSameRevisionAs: aRGClassDescriptionDefinition)
		and:[ self instVarNames sort = aRGClassDescriptionDefinition instVarNames sort ]
]

{
	#category : #organization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>organization [
	"Answer the instance of ClassOrganizer that represents the organization 
	of the messages of the receiver."

	organization ifNil: [
		self organization: (ClassOrganization forClass: self) ].
	"Making sure that subject is set correctly. It should not be necessary."
	organization ifNotNil: [ organization setSubject: self ].
	^ organization
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>organization: aClassOrg [
	"Install an instance of ClassOrganizer that represents the organization of the messages of the receiver."

	aClassOrg ifNotNil: [aClassOrg setSubject: self].
	organization := aClassOrg
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>removeInstVarNamed: aString [

	self removeVariable: (self instanceVariableNamed: aString) from: instanceVariables
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>removeInstanceVariable: aRGVariableDefinition [
	"aRGVariableDefinition is a instance variable or class instance variable"

	self removeVariable: aRGVariableDefinition from: instanceVariables
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>removeVariable: aRGVariableDefinition from: aCollection [
	"Removes a variable from a particular collection.
	This behavior is the same for any kind of variable"
	aCollection remove: aRGVariableDefinition ifAbsent:[]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDescriptionDefinition>>storeOn: aStream [
	aStream
		nextPutAll: '(';
		nextPutAll: self class name;
		nextPutAll: ' named: '.
	name storeOn: aStream.
	aStream nextPut: $)
]
