"
I model a temporary virable, similar to Slot and LiteralVariable.

For now I am cread on need and never persisted. (this might change later
to allow me to be annotated with properties.)

I know the method that I come from. If I am a block temp, I record the startPC of that block.
"
Class {
	#name : #TemporaryVariable,
	#superclass : #Object,
	#instVars : [
		'name',
		'method',
		'startpc'
	],
	#classVars : [
		'PersistentTemps',
		'Properties'
	],
	#category : #Slot-Variables,
	#timestamp : ''
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable class>>initialize [
	Properties
		ifNil: [ self initializeProperties ]
		ifNotNil: [ | newDict | 
			newDict := WeakIdentityKeyDictionary newFrom: Properties.
			newDict rehash.
			Properties := newDict ].
	PersistentTemps ifNil: [ PersistentTemps := Set new]
		
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable class>>initializeProperties [
	Properties := WeakIdentityKeyDictionary new.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable class>>name: aName block: aBlock [
	^(self new 
		name: aName;
		method: aBlock method;
		startpc: aBlock startpc) yourselfOrSaved.		
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable class>>name: aName context: aContext [
	^aContext isBlock
		ifTrue: [ self name: aName block: aContext closure ]
		ifFalse: [ self name: aName method: aContext method ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable class>>name: aName method: aMethod [
	^(self new 
		name: aName;
		method: aMethod) yourselfOrSaved
	
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>= other [
	self == other
		ifTrue: [ ^ true ].
	^ (self species == other species) 
			and: [ name = other name 
			and: [ method = other method
			and: [ startpc = other startpc ] ] ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>ensureProperties [
	method saveTemp: self.
	^ Properties at: self ifAbsentPut: WeakKeyDictionary new
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>hasProperty: aKey [
	"Test if the property aKey is present."
	^self properties 
		ifNil: [false]
		ifNotNil: [:prop | prop includesKey: aKey]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>hash [

	^ (name hash
		bitXor: method hash)
		bitXor: (startpc ifNil: [0])
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>isFromBlock [
	^startpc isNotNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>method [
	^ method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>method: anObject [
	method := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>name: anObject [
	name := anObject
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>properties [
	^ Properties at: self ifAbsent: nil
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>propertyAt: propName [
	^ self
		propertyAt: propName
		ifAbsent: [ nil ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>propertyAt: propName ifAbsent: aBlock [
	self properties ifNil: [^aBlock value].
	^ self properties
		at: propName
		ifAbsent: aBlock
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>propertyAt: propName put: propValue [
	^ self ensureProperties
		at: propName
		put: propValue
]

{
	#category : #'reflecive api',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>readInContext: aContext [
	^aContext tempNamed: name
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>removePropertiesIfEmpty [
	^ Properties at: self ifPresent: [ :dict |
		dict ifEmpty: [ 
			method removeSavedTemp: self.
			Properties removeKey: self ] ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>removeProperty: propName [
	^ self
		removeProperty: propName
		ifAbsent: [ nil ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>removeProperty: propName ifAbsent: aBlock [
	| property |
	self properties ifNil: [^aBlock value].
	property := self properties
		removeKey: propName
		ifAbsent: aBlock.
	self removePropertiesIfEmpty.
	^ property
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>startpc [
	^ startpc
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>startpc: anObject [
	startpc := anObject
]

{
	#category : #'reflecive api',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>write: aValue InContext: aContext [
	aContext tempNamed: name put: aValue
]

{
	#category : #'saved temps',
	#timestamp : ' 8/31/2017 07:16:35'
}
TemporaryVariable>>yourselfOrSaved [
	method savedTemps ifNil: [ ^self  ].	
	^method savedTemps 
		detect:  	[ :each | each = self ]
		ifFound: [ :found | found ]
		ifNone: 	[ self ]
]
