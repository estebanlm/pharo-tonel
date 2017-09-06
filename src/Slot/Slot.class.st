"
I'm a meta-object for accessing a slot in an Object. 

I define a protocol to read (#read:) and to write (#write:to:) values. 

For customizing a subclass can override the meta-object-protocol methods. See subclasses for examples.

Vocabulary:
- variable: named accessor for a Slot
- Slot: class-side meta-object, mapping of names to values using a MOP to fields
- field: space occupied in an object, used to hold values accessed via Slots
"
Class {
	#name : #Slot,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classVars : [
		'Properties'
	],
	#classInstVars : [
		'slotClassDefinition'
	],
	#category : #Slot-Variables,
	#timestamp : 'CyrilFerlicot 8/15/2017 1:20'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>asSlot [
	^ self new
]

{
	#category : #validating,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>checkValidName: aSymbol [
	aSymbol isPseudovariableName ifTrue: [ 
		^ InvalidSlotName signalFor: aSymbol ]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>initialize [
	Properties
		ifNil: [ self initializeProperties ]
		ifNotNil: [ | newDict | 
			newDict := WeakIdentityKeyDictionary newFrom: Properties.
			newDict rehash.
			Properties := newDict ]
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>initializeProperties [
	Properties := WeakIdentityKeyDictionary new.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>named: aSymbol [
	self checkValidName: aSymbol.
	^ self new
		name: aSymbol;
		yourself
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>showSlotClassDefinition [
	^slotClassDefinition ifNil: [ slotClassDefinition := false ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>showSlotClassDefinition: aBoolean [
	slotClassDefinition := aBoolean
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot class>>slotSetting: aBuilder  [
	<systemsettings>
	(aBuilder setting: #showSlotClassDefinition) 
		label: 'Class Template with Slots';
		description: 'If checked then browsers show always the slot class definition';
		parent: #codeBrowsing; 
		target: self
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>= other [
	self == other
		ifTrue: [ ^ true ].
	^ (self species == other species) 
			and: [ name = other name ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>addSlotInitToInitialize: aClass [
	|  source |
	
	((aClass>>#initialize) hasLiteral: #initializeSlots:)ifTrue: [^self ].
	
	source := (aClass>>#initialize) sourceCode.
	(source endsWith: '.') ifFalse: [ source := source, '.' ].
	source := source, '
	self class initializeSlots: self.'.
	Author useAuthor: 'Generated' during: [aClass compile: source classified: 'initialization']. 
	
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>asSlot [
	^ self
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>changingIn: aClass [
	"the slot was changed. Default is to do nothing"
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>definingClass [
	^(Smalltalk globals allClasses flatCollect: [:each | {each . each classSide} ]) 
		detect: [ :class | class classLayout definesSlot: self] 
		ifNone: [ nil ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>definitionString [
	"for Slots, the printString is the defintion"
	^self printString
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>emitStore: aMethodBuilder [
	| tempName |
	tempName := Object new.
	aMethodBuilder
		addTemp: tempName;
		storeTemp: tempName;
		popTop;
		pushReceiver;
		pushLiteralVariable: #slot -> self;
		pushTemp: tempName;
		send: #writeSlot:value:
]

{
	#category : #'code generation',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>emitValue: aMethodBuilder [
	aMethodBuilder
		pushLiteralVariable: #slot -> self;
		pushReceiver;
		send: #read:
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>ensureInitalizeMethodExists: aClass [
	(aClass includesSelector:  #initialize) ifTrue: [ ^self ].
	Author useAuthor: 'Generated' during: [
		aClass compile: 'initialize
	super initialize.' classified: 'initialization'.
		] 
	
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>ensureProperties [
	^ Properties at: self ifAbsentPut: WeakKeyDictionary new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>ensureSlotIniatializationFor: aClass [
	self ensureInitalizeMethodExists: aClass. 
	self addSlotInitToInitialize: aClass.
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>finalize: layout [
	"nothing to do here"
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>hasProperty: aKey [
	"Test if the property aKey is present."
	^self properties 
		ifNil: [false]
		ifNotNil: [:prop | prop includesKey: aKey]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>hash [
	^ self species hash bitXor: self name hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>initialize: instance [
	"nothing to do for the default slot"
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>installingIn: aClass [
	"I am called by the class builder. This way a Slot can change the class it is installed in"
	self wantsInitalization ifTrue: [ self ensureSlotIniatializationFor: aClass ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isGlobal [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isReadIn: aCompiledCode [
	^aCompiledCode readsSlot: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isSelfEvaluating [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isSpecial [
	"I am more than just a backward compatible ivar slot"
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isVirtual [
	"virtual slots do not take up space in the object and have size = 0"
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isVisible [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>isWrittenIn: aCompiledCode [
	^aCompiledCode writesSlot: self
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>layoutChanged: aClass [
	"I am called by the class builder. This way a Slot can change the class it is installed in"
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>name: aSymbol [
	name := aSymbol
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>printOn: aStream [
	aStream 
		store: self name;
		nextPutAll: ' => ';
		nextPutAll: self class name
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>properties [
	^ Properties at: self ifAbsent: nil
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>propertyAt: propName [
	^ self
		propertyAt: propName
		ifAbsent: [ nil ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>propertyAt: propName ifAbsent: aBlock [
	self properties ifNil: [^aBlock value].
	^ self properties
		at: propName
		ifAbsent: aBlock
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>propertyAt: aKey ifAbsentPut: aBlock [
	"Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value."
	
	^ self propertyAt: aKey ifAbsent: [ self propertyAt: aKey put: aBlock value ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>propertyAt: propName put: propValue [
	^ self ensureProperties
		at: propName
		put: propValue
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>read: anObject [
	^ self subclassResponsibility
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>removePropertiesIfEmpty [
	^ Properties at: self ifPresent: [ :dict |
		dict ifEmpty: [ Properties removeKey: self ] ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>removeProperty: propName [
	^ self
		removeProperty: propName
		ifAbsent: [ nil ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>removeProperty: propName ifAbsent: aBlock [
	| property |
	self properties ifNil: [^aBlock value].
	property := self properties
		removeKey: propName
		ifAbsent: aBlock.
	self removePropertiesIfEmpty.
	^ property
]

{
	#category : #'class building',
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>removingFrom: aClass [
	"I am called by the class builder. This way a Slot can change the class it is installed in"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>scope: aScope [
	"ignored, subclasses can override to analyze the scope they are to be installed in"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>size [
	"normally a slot takes one ivar. Virtual slots do not take space. 
	 We could even have Slots that map to multiple ivars"
	^self isVirtual ifTrue: [0] ifFalse: [1]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>storeOn: aStream [
	^self printOn: aStream
]

{
	#category : #queries,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>usingMethods [
	"All methods that read or write the slot"
	^self definingClass 
		ifNil: [ #() ]
		ifNotNil: [:class | class allMethodsAccessingSlot: self].
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>wantsInitalization [
	"if a slot wants to hable initalization, return true here"
	^false
]

{
	#category : #meta-object-protocol,
	#timestamp : ' 8/31/2017 07:16:35'
}
Slot>>write: aValue to: anObject [
	^self subclassResponsibility
]
