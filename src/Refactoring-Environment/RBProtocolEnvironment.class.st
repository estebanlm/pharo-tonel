"
I am a RBBrowserEnvironment on a set of protocols of a class.

Example:
(RBBrowserEnvironment new) forClass:Morph protocols:{'printing'}.
"
Class {
	#name : #RBProtocolEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'class',
		'protocols'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment class>>class: aClass protocols: aCollection [
	^ self 
		onEnvironment: self default
		class: aClass
		protocols: aCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment class>>onEnvironment: anEnvironment class: aClass protocols: aCollection [
	^(self onEnvironment: anEnvironment)
		class: aClass protocols: aCollection; yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>class: aClass protocols: aCollection [
	class := aClass.
	protocols := aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>defaultLabel [
	| stream |
	stream := String new writeStream.
	stream nextPutAll: class name;
		nextPut: $>.
	protocols do: 
			[:each | 
			stream nextPutAll: each;
				nextPut: $ ].
	^stream contents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>definesClass: aClass [
	^ aClass == class and: [super definesClass: aClass]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>includesCategory: aCategory [
	^ (super includesCategory: aCategory) and: [
		(environment classNamesFor: aCategory)
			inject: false into: [ :bool :each |
				bool or: [
					| aClass |
					aClass := self systemDictionary at: each ifAbsent: [ nil ].
					aClass == class or: [ aClass class == class ] ] ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>includesClass: aClass [
	^ aClass == class and: [super includesClass: aClass]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>includesProtocol: aProtocol in: aClass [
	^aClass == class and: [(super includesProtocol: aProtocol in: aClass)
			and: [protocols includes: aProtocol]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>includesSelector: aSelector in: aClass  [
	^(super includesSelector: aSelector in: aClass) and: 
			[protocols 
				includes: (environment whichProtocolIncludes: aSelector in: aClass)]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>isEmpty [
	^protocols isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>packages [
	^ self methods collect: [ :m | m package ]
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>postCopy [
	super postCopy.
	protocols := protocols copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBProtocolEnvironment>>storeOn: aStream  [
	aStream nextPut: $(.
	super storeOn: aStream.
	aStream
		nextPutAll: ' class: ';
		nextPutAll: class name;
		nextPutAll: ' protocols: '.
	protocols asArray storeOn: aStream.
	aStream nextPut: $)
]
