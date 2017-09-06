"
An RGBehaviorDefinition is an abstract definition for class-alike entities (e.g. classes, traits)

Instance Variables
	methods:		<Collection>
	protocols:		<Collection>
	superclass:		<Object>
"
Class {
	#name : #RGBehaviorDefinition,
	#superclass : #RGGlobalDefinition,
	#instVars : [
		'superclass',
		'methods',
		'protocols'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 5/9/2011 14:30'
}

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>allSubclassesKey [

	^#allSubclasses
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>allSuperclassesKey [

	^#allSuperclasses
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>definitionSourceKey [

	^#definitionSource
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>isPoolKey [

	^#isPool
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>subclassesKey [

	^#subclasses
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>superclassNameKey [
	
	^#superclassName
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>superclassesKey [

	^#superclasses
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>traitCompositionSourceKey [

	^#traitCompositionSource
]

{
	#category : #class-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition class>>usersKey [

	^#users
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>addInContainer: aRGContainer [

	aRGContainer addClass: self
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>addMethod: aRGMethodDefinition [
	"Adds aRGMethodDefinition in the methods dictionary.
	 Adds the protocol of such method too"

	self addMethod: aRGMethodDefinition in: methods.
	self addProtocol: aRGMethodDefinition protocol
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>addMethod: aRGMethodDefinition in: aCollection [
	"Adds aRGMethodDefinition in the collection received"

	aRGMethodDefinition parent ifNil:[ aRGMethodDefinition parent: self ].
	aCollection at: aRGMethodDefinition selector
		put: aRGMethodDefinition
]

{
	#category : #'adding/removing protocols',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>addProtocol: anObject [
	"Adds a protocol named anObject.
	Protocols are not repeated"
	
	anObject ifNil:[ ^self ].
	protocols add: anObject
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>addSelector: selectorName classified: protocolName sourced: source [

	self addMethod: ((RGMethodDefinition named: selectorName) 
							parent: self;
							protocol: protocolName;
							sourceCode: source;
							yourself)
]

{
	#category : #subclassing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>addSubclass: aRGBehaviorDefinition [
	"Adds a direct subclass of the receiver"

	(self subclasses includes: aRGBehaviorDefinition)
		ifFalse:[ self subclasses add: aRGBehaviorDefinition ]
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>allSelectors [
	"Retrieves all the selectos of the receiver in the chain hierarchy"
	| class selectors |
	
	class:= self.
	selectors := Set new.
	[class notNil] whileTrue: 
			[selectors addAll: class selectors.
			class := class superclass ].
	^selectors
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>allSubclasses [
	"Retrieves all the subclasses of the receiver in the chan hiearchy - value is kept as an annotation"
	"is a good idea storing this?"
	
	^self annotationNamed: self class allSubclassesKey
		ifAbsentPut:[ | collection index |
			index := 1.
			collection := OrderedCollection withAll: self subclasses.
			[index <= collection size] whileTrue: 
				[collection addAll: (collection at: index) subclasses.
				index := index + 1].
			collection ]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>allSubclasses: aCollection [
	"Stores all the subclasses (direct and indirect) as an annotation"
	
	self annotationNamed: self class allSubclassesKey
		ifAbsentPut:[ aCollection ]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>allSuperclasses [
	"Answer an OrderedCollection of the receiver's and the receiver's  
	ancestor's superclasses"
	"Is implementation of Behavior more efficient?"
	
	^self annotationNamed: self class allSuperclassesKey
		ifAbsentPut:[ | supers sprClass |
			supers := OrderedCollection new.
			sprClass := self superclass.
			[sprClass notNil] whileTrue: 
				[supers add: sprClass.
				sprClass := sprClass superclass].
			supers ]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>allSuperclasses: aCollection [
	"Stores all the superclasses (direct and indirect) as an annotation"
	
	self annotationNamed: self class allSuperclassesKey
		ifAbsentPut:[ aCollection ]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>allSuperclassesDo: aBlock [
	"Evaluate the argument, aBlock, for each of the receiver's superclasses."

	self superclass isNil
		ifTrue: [ ^ self ].
	aBlock value: superclass.
	superclass allSuperclassesDo: aBlock
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>compiledMethodNamed: selector [
	"Retrieves the compiled method from aRGMethodDefinition"
	| method |

	^(method:= self methodNamed: selector) notNil
	ifTrue: [ method compiledMethod ]
	ifFalse:[ nil ]
]

{
	#category : #filein/out,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>definition [

	^ self definitionSource
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>definitionSource [
	"Retrieves the definition template of the receiver -> aString.
	This value is kept as an annotation"
	
	^self annotationNamed: self class definitionSourceKey
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>definitionSource: aString [
	"Sets the definition template of the receiver -> aString.
	It's stored as an annotation"
	
	self annotationNamed: self class definitionSourceKey
		put: aString
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>extensionMethods [

	^self methods select:[ :each | each isExtension ]
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>hasDefinitionSource [
	"Tests whether the receiver has a source definition."
	
	^ self definitionSource notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>hasMetaclass [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>hasMethods [
	"validates the existance of methods"

	^methods notEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>hasProtocols [
	"Validates the existance of protocols"

	^protocols notEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>hasSuperclass [

	^superclass notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>hasTraitComposition [

	^self traitCompositionSource ~= '{}'
]

{
	#category : #'testing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>includesBehavior: aClass [
	^self == aClass or: [self inheritsFrom: aClass]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>includesProtocol: aString [
	    "Looks for a protocols named = aString"
    
	    ^protocols includes: aString
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>includesSelector: selector [
	"Looks if selector is a key in the methods dictionary"
	
	^methods includesKey: selector asSymbol
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>initialize [

	super initialize.
	methods:= IdentityDictionary new.
	protocols:= Set new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>isDefined [
	"If the class exists in the environment"
	
	^self realClass notNil
	
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>isIncludedInContainer: aRGContainer [

	^aRGContainer includesClass: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>isMeta [
	"By default is considered a non-meta class"

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>isSameRevisionAs: aRGBehaviorDefinition [
	"This method look for equality of the properties of the receiver"

	^self class = aRGBehaviorDefinition class
		and:[ self name == aRGBehaviorDefinition name ]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>methodDict [
	^ methods
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>methodNamed: selector [
	"Retrieves aRGMethodDefinition that matches the selector given as argument"
	"RB defines methodFor:"

	^methods at: selector asSymbol ifAbsent:[ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>methods [

	^methods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>methods: aDictionary [

	methods:= aDictionary
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>methodsInProtocol: aString [
	"Retrieves the methods classified in protocol named aString"

	^methods select: [ :each | each protocol = aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>package [
	
	self subclassResponsibility
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>printOn: aStream  [
	aStream nextPutAll: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>protocols [
	"retrieves the protocols of the class"

	^protocols
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>protocols: aCollection [
	"set the protocols of the class"

	protocols:= aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>realClass [
	"Retrieves the current class existing in the runtime environment"

	^self rootEnvironment classNamed: self name 
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>removeFromContainer: aRGContainer [

	aRGContainer removeClass: self
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>removeMethod: aRGMethodDefinition [
	"Removes aRGMethodDefinition from the methods dictionary"

	self removeMethod: aRGMethodDefinition from: methods
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>removeMethod: aRGMethodDefinition from: aCollection [
	"Removes aRGMethodDefinition from the collection received"

	aCollection removeKey: aRGMethodDefinition selector ifAbsent:[]
]

{
	#category : #'adding/removing protocols',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>removeProtocol: aString [
	"Removes a protocol named aString (if exists)"

	protocols remove: aString ifAbsent:[]
]

{
	#category : #'adding/removing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>removeSelector: selector [
	"Removes a method named as selector"

	methods removeKey: selector ifAbsent:[]
]

{
	#category : #subclassing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>removeSubclass: aRGBehaviorDefinition  [
	"Removes aRGAbstractClassDefinition from the direct subclasses - without failing if does not exist"
	
	self subclasses remove: aRGBehaviorDefinition ifAbsent: []
]

{
	#category : #'accessing methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>selectors [
	"Retrieves the method selectors"

	^methods keys
]

{
	#category : #compatibility,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>soleInstance [
	"to be depracated in the future"
	
	^self theNonMetaClass
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>storeOn: aStream  [
	self name storeOn: aStream
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>subclasses [
	"Retrieves the direct subclasses of the receiver.
	This value is kept as an annotation"

	^self annotationNamed: self class subclassesKey
		ifAbsentPut:[ OrderedCollection new ]
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>subclasses: aCollection [
	"Stores direct subclasses of the receiver as an annotation"

	self annotationNamed: self class subclassesKey
		ifAbsentPut:[ aCollection ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>superclass [

	^superclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>superclass: aRGBehaviorDefinition [
	"The superclass is assigned.
	If aRGBehaviorDefinition is not nil the receiver is added as a subclass and the superclass assignment also happens for theMetaClass"

	superclass := aRGBehaviorDefinition.
	superclass notNil
		ifFalse: [ ^ self ].
	self superclassName: aRGBehaviorDefinition name.
	aRGBehaviorDefinition addSubclass: self.
	self hasMetaclass
		ifTrue: [ self theMetaClass superclass: aRGBehaviorDefinition theMetaClass ]
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>superclassName [
	"Retrieves the name of the superclass if exists"

	^self annotationNamed: self class superclassNameKey
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>superclassName: aSymbol [

	self annotationNamed: self class superclassNameKey 
		put: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>theMetaClass [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>theNonMetaClass [

	self subclassResponsibility
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>traitCompositionSource [
	"Retrieves aString representing the used traits"

	^self annotationNamed: self class traitCompositionSourceKey
		ifAbsentPut:[  '{}'  ]
]

{
	#category : #annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>traitCompositionSource: anString [
	"Stores aString representing the traits used by the receiver "

	self annotationNamed: self class traitCompositionSourceKey
		put: anString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>traitNames [
	"Assuming that traits in a composition can be identified by
	testing for the first character being an uppercase character
	(and thus not a special character such as {, # etc.)"
	| tokens |
	
	tokens := self traitCompositionSource parseLiterals flattened.
	^tokens select: [:each | each first isUppercase].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>traits [
	"Retrieves ring traits based on the names in the traitComposition and from the environment if it is a ring object"
	
	^ self environment isRingObject 	
		ifTrue: [ self traitNames collect:[ :each| self environment traitNamed: each ] ]
		ifFalse:[ #() ]
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>withAllSubclasses [
	"if allSubclasses is stored should not affect the collection"

	^self allSubclasses, {self}
]

{
	#category : #'accessing class hierarchy',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGBehaviorDefinition>>withAllSuperclasses [
	"if allSuperclasses is stored should not affect the collection"

	^self allSuperclasses, {self}
]
