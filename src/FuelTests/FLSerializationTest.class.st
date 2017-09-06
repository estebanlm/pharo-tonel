"
Superclass for serialization tests
"
Class {
	#name : #FLSerializationTest,
	#superclass : #TestCase,
	#instVars : [
		'serializer',
		'materializer',
		'classFactory',
		'streamFactory',
		'traits'
	],
	#category : #FuelTests,
	#timestamp : 'TorstenBergmann 2/3/2014 23:24'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest class>>packageNamesUnderTest [
	^ #('Fuel')
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>analyzer [
	^serializer analyzer
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>assertSerializationEqualityOf: anObject [
	"Asserts that the original object and the materialized one are equal (but not the same)"

	| materialized |
	materialized := self resultOfSerializeAndMaterialize: anObject.
	self assert: anObject ~~ materialized description: 'The materialized object should not be the same as the serialized one'.
	self assert: anObject = materialized description: 'The materialized object should be equal to serialized one'.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>assertSerializationIdentityOf: anObject [
	"Asserts that the original object and the materialized one are the same"

	| result |
	result := self resultOfSerializeAndMaterialize: anObject.
	self 
		assert: anObject == result 
		description: 'The materialized object is not the same as the serialized one'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>classFactory [
	^classFactory
]

{
	#category : #traits-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>cleanUpTraits [
	self traits do: [ :aTrait | self removeFromSystem: aTrait ]
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>deleteFileNamed: aFilename [
	 FLPlatform current deleteFileNamed: aFilename
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>materialization [
	
	self streamFactory readStreamDo: [:aStream |
		^ self materializer materializeFrom: aStream ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>materializationHeader [
	
	self streamFactory readStreamDo: [:aStream |
		^ self materializer materializeHeaderFrom: aStream ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>materialized [
	
	^ self materialization root
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>materializedObjects [
	
	^ self materialization objects
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>materializer [
	^materializer
]

{
	#category : #class-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>newClass [
	^ self newSubclassOf: Object 
		instanceVariableNames: '' 
		classVariableNames: ''

]

{
	#category : #class-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>newClassInCategory: aCategory [
	^ self classFactory silentlyNewClassInCategory: aCategory
]

{
	#category : #class-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>newSubclassNamed: nameString of: aClass  instanceVariableNames: ivNamesString classVariableNames: classVarsString [
	| class |
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		class := aClass
			subclass: nameString asSymbol
			instanceVariableNames: ivNamesString
			classVariableNames:  classVarsString
			category: self classFactory defaultCategory
	].
	self classFactory createdClasses add: class.
	^ class
]

{
	#category : #class-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>newSubclassOf: aClass  instanceVariableNames: ivNamesString classVariableNames: classVarsString [
	^ self classFactory silentlyNewSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString
]

{
	#category : #traits-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>newTraitNamed: traitName inCategory: aCategory [

	^ Trait 
		named: traitName asSymbol
		uses: Array new 
		category: aCategory asSymbol
]

{
	#category : #traits-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>newTraitSuffixed: suffix [

	| trait |
	trait := Trait 
		named: (self traitNamePrefix, suffix) asSymbol
		uses: Array new 
		category: (self classFactory packageName, '-', self classFactory defaultCategoryPostfix) asSymbol.
	self traits add: trait.
	
	^ trait
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>removeFromSystem: aClassOrTrait [
	aClassOrTrait removeFromSystem: false
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>resultOfSerializeAndMaterialize: anObject [

	self serialize: anObject.
	^ self materialized

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>resultOfSerializeAndMaterializeCompiledMethod: aCompiledMethod [
	| materialized |
	materialized := self resultOfSerializeAndMaterialize: aCompiledMethod.
	self assert: (materialized isEqualRegardlessTrailerTo: aCompiledMethod)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>resultOfSerializeAndMaterializeMethod: aCompiledMethod [
	self analyzer considerInternalMethod: aCompiledMethod. 
	self serialize: aCompiledMethod.
	^ self materialized

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>resultOfSerializeAndMaterializeMethodDictionary: aMethodDictionary [
	| materialized |
	materialized := self resultOfSerializeAndMaterialize: aMethodDictionary.
	self assert: (materialized isEqualRegardlessMethodsTrailerTo: aMethodDictionary)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>serializationOf: anObject  [
	self streamFactory writeStreamDo: [:aStream |
	^ serializer serialize: anObject on: aStream. ].

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>serializationOf: anObject includes: anotherObject  [
	| serialization |
	self streamFactory writeStreamDo: [:aStream |
	serialization := serializer serialize: anObject on: aStream.
	^ serialization objects includes: anotherObject ].
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>serialize: anObject [

	self streamFactory writeStreamDo: [:aStream |
		self serializer serialize: anObject on: aStream ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>serializer [
	^serializer
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>setUp [
	super setUp.
	self setUpClassFactory.
	self setUpSerializer.
	self setUpMaterializer.
	"You have several stream strategies available on 'stream-strategies' category."
	self useMemoryStream.

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>setUpClassFactory [
	classFactory := ClassFactoryForTestCase new

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>setUpMaterializer [
	materializer := FLMaterializer newDefault
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>setUpSerializer [
	serializer := FLSerializer newDefault
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>streamFactory [
	^streamFactory
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>tearDown [
	super tearDown.
	"Traits should be cleaned before classFactory because it seems class factory only knwos how to clean classes, not traits."
	self tearDownTraits.
	self tearDownClassFactory.
	self tearDownGlobalVariables.
	self streamFactory tearDown.
	self tearDownInstanceVariables.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>tearDownClassFactory [
	self classFactory cleanUp
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>tearDownGlobalVariables [

	Smalltalk globals removeKey: #FLGlobalVariableForTesting ifAbsent: []
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>tearDownInstanceVariables [
	self class withAllSuperclasses do: [ :class |
		class = TestCase ifTrue: [ ^ self ].
		
		class instVarNames do: [ :varName |
			self 
				instVarNamed: varName
				put: nil ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>tearDownTraits [
	self cleanUpTraits
]

{
	#category : #traits-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>traitNamePrefix [
	^'FLTraitForTesting'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>traits	 [
	^ traits ifNil: [ traits := OrderedCollection new ]
]

{
	#category : #stream-strategies,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>useBinaryFileStream [

	streamFactory := FLFileStreamStrategy newWithBinaryFileStream
]

{
	#category : #stream-strategies,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>useGzipInMemoryStream [

	streamFactory := FLGZipStrategy newWithTarget: FLByteArrayStreamStrategy new
]

{
	#category : #stream-strategies,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>useInMemorySerializationStream  [
	"This is a special factory to test what we offer with FLSerializer class >> #serializeInMemory:  and  FLMaterializer class >> #materializeFromByteArray: "
	streamFactory := FLByteArrayStreamStrategy new
]

{
	#category : #stream-strategies,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>useMemoryStream [

	streamFactory := FLMultiByteStreamStrategy new
]

{
	#category : #stream-strategies,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>useMultiByteFileStream [

	streamFactory := FLFileStreamStrategy newWithMultiByteFileStream
]

{
	#category : #stream-strategies,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>useStandardFileStream [

	streamFactory := FLFileStreamStrategy newWithStandardFileStream
]

{
	#category : #class-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>withNotificationsNewClass [
	^ self classFactory withNotificationsNewClass
]

{
	#category : #class-factory,
	#timestamp : ' 8/31/2017 05:26:30'
}
FLSerializationTest>>withNotificationsNewClassWithInstanceVariableNames: instanceVariableNames [
	"Returns a class for testing, with the specified instance variables."

	^ classFactory withNotificationsNewClassWithInstanceVariableNames: instanceVariableNames
]
