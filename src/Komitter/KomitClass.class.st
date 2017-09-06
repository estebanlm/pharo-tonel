"
I am encapsulating a class and the operations which has been applied to it.

I implement a flyweight DP
"
Class {
	#name : #KomitClass,
	#superclass : #KomitObject,
	#instVars : [
		'operations',
		'trackedClass',
		'definition',
		'methods',
		'definitions'
	],
	#classInstVars : [
		'classes'
	],
	#category : #Komitter-Models,
	#timestamp : 'StephaneDucasse 11/24/2015 18:55'
}

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass class>>initialize [

	classes := Dictionary new.
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass class>>resetCache [

	classes removeAll
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass class>>trackedClass: trackedClass [

	^ classes 
		at: trackedClass name
		ifAbsentPut: [ self new 
			trackedClass: trackedClass;
			yourself ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass class>>trackedClass: trackedClass forExtension: aCategory [

	^ classes 
		at: trackedClass name, aCategory
		ifAbsentPut: [ self new 
			trackedClass: trackedClass;
			yourself ]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>><= aKomitObject  [

	^ self class name <= aKomitObject class name
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addClassDefinition: aMCRemoval  [

	self definition: aMCRemoval
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addMethodDefinition: aMCAddition [

	self addOperation: aMCAddition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addOperation: anOperation [

	operations add: anOperation
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>addOrganizationDefinition: aMCModification  [
	
	self addOperation: aMCModification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>definition [
	^ definition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>definition: aMCRemoval  [
	
	definition := aMCRemoval
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>definitions [

	^ definitions ifNil: [ definitions := (self operations
		select: [ :each | each isClassPatch ]
		thenCollect: [ :each | each koDefinition ]) sorted ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>flush [
	super flush.
	definition := nil.
	operations removeAll.
	methods ifNotNil: [ :m | m do: [ :e | e flush ] ].
	methods := nil.
	definitions ifNotNil: [ :d | d do: [ :e | e flush ] ].
	definitions := nil
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>initialize [

	super initialize.
	operations := Set new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>isKomitClass [

	^ true
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>koDestinationText [

	^ self isDirty
		ifTrue: [ self definition koDestinationText ]
		ifFalse: [ '' ]
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>koSourceText [

	^ self isDirty
		ifFalse: [ 'No changes' ]
		ifTrue: [ self definition koSourceText ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>methods [

	^ methods ifNil: [ methods := (self operations 
		select: [ :each | each isMethodPatch ]
		thenCollect: [ :each | each koMethod ]) sorted ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>operations [
	
	^ (definition
		ifNil: [ operations ]
		ifNotNil: [ {definition}, operations asOrderedCollection ]) asOrderedCollection
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>printOn: aStream [

	super printOn: aStream.
	aStream << '[ '.
	self trackedClass printOn: aStream.
	aStream << ' ]'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>trackedClass [
	^ trackedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitClass>>trackedClass: anObject [
	trackedClass := anObject
]
