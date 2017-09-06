"
I know how to map an object to its default cluster. I can map every object.
"
Class {
	#name : #FLLightGeneralMapper,
	#superclass : #FLMapper,
	#category : #Fuel-Mappers,
	#timestamp : '<historical>'
}

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>clusterClassForSmallInteger: aSmallInteger [

	aSmallInteger >= 0 ifTrue: [
		aSmallInteger <= 255 ifTrue: [^ FLPositive8SmallIntegerCluster].
		aSmallInteger <= 65535 ifTrue: [^ FLPositive16SmallIntegerCluster].
		aSmallInteger <= 16777215 ifTrue: [^ FLPositive24SmallIntegerCluster].
		aSmallInteger <= 4294967295 ifTrue: [^ FLPositive32SmallIntegerCluster].
	].
	aSmallInteger >= -128 ifTrue: [^ FLNegative8SmallIntegerCluster].
	aSmallInteger >= -32768 ifTrue: [^ FLNegative16SmallIntegerCluster].
	aSmallInteger >= -8388608 ifTrue: [^ FLNegative24SmallIntegerCluster].
	aSmallInteger >= -2147483648 ifTrue: [^ FLNegative32SmallIntegerCluster].


]

{
	#category : #mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>mapAndTrace: anObject [

	anObject fuelAccept: self

]

{
	#category : #protected-mapping,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>mapAndTraceInstanceSideGlobal: aClassOrTrait [

	(self clusterKeyedByClusterName: FLGlobalClassCluster)
		add: aClassOrTrait traceWith: analysis

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitBytesObject: anObject [

	self mapAndTraceByObjectClass: anObject to: FLByteObjectCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitClass: aClass [

	self mapAndTraceInstanceSideGlobal: aClass
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitClassTrait: aClassTrait [

	self mapAndTraceByClusterName: aClassTrait to: FLGlobalClassSideCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitCompiledMethod: aCompiledMethod [
	(aCompiledMethod isInstalled not or: [aCompiledMethod isDoIt ])
		ifTrue: [ self mapAndTraceByClusterName: aCompiledMethod to: FLCompiledMethodCluster ]
		ifFalse: [self mapAndTraceByClusterName: aCompiledMethod to: FLGlobalCompiledMethodCluster]
		
	
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitDictionary: aDictionary [

	self mapAndTraceByObjectClass: aDictionary to: FLDictionaryCollectionCluster

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitFixedObject: anObject [

	self mapAndTraceByObjectClass: anObject to: FLFixedObjectCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitGlobalSend: anObject name: globalName selector: aSymbol [

	(self clusterKeyedByClusterName: FLGlobalSendCluster)
		add: anObject name: globalName selector: aSymbol traceWith: analysis

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitHookPrimitive: anObject [

	self mapAndTraceByObjectClass: anObject to: FLHookPrimitiveCluster
	
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitMetaclass: aMetaclass [

	self mapAndTraceByClusterName: aMetaclass to: FLGlobalClassSideCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitMethodContext: aMethodContext [

	self mapAndTraceByObjectClass: aMethodContext to: FLContextCluster

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitNotSerializable: anObject [
	FLNotSerializable signalWith: anObject
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitPoint: aPoint [

	self mapAndTraceByClusterName: aPoint to: FLPointCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitRectangle: aRectangle [

	self mapAndTraceByClusterName: aRectangle to: FLRectangleCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitSimpleCollection: aCollection [
	self mapAndTraceByObjectClass: aCollection to: FLSimpleCollectionCluster

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitSmallInteger: aSmallInteger [

	self mapAndTraceByClusterName: aSmallInteger to: (self clusterClassForSmallInteger: aSmallInteger)
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitSubstitution: anObject by: anotherObject [

	(self clusterKeyedByClusterName: FLSubstitutionCluster)
		add: anObject substitutedBy: anotherObject traceWith: analysis

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitSubstitution: anObject by: anotherObject onRecursionDo: aBlock [

	| cluster |
	cluster := self clusterKeyedByClusterName: FLSubstitutionCluster.

	(cluster isSubstitute: anObject)
		ifTrue: aBlock
		ifFalse: [
			cluster
				add: anObject
				substitutedBy: anotherObject
				traceWith: analysis ]

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitTrait: aTrait [

	self mapAndTraceInstanceSideGlobal: aTrait
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitVariableObject: anObject [

	self mapAndTraceByObjectClass: anObject to: FLVariableObjectCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitWeakObject: anObject [

	self mapAndTraceByObjectClass: anObject to: FLWeakVariableObjectCluster
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:12'
}
FLLightGeneralMapper>>visitWordsObject: anObject [

	self mapAndTraceByObjectClass: anObject to: FLWordObjectCluster
]
