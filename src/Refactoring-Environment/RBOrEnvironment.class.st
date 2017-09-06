"
I am the combination of two RBEnvironments, a logical OR. That is: 
entity A is in this environment if it is in at least ONE environment I am constructed from.

Do not construct instances of me directly, use method #| for two existing environments:
env1 | env2 -> a RBOrEnvironment.
"
Class {
	#name : #RBOrEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'orEnvironment'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment class>>onEnvironment: anEnvironment or: anotherEnvironment [
	^ (self onEnvironment: anEnvironment)
		orEnvironment: anotherEnvironment;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>classesDo: aBlock [
	| enumerated |
	enumerated := IdentitySet new.
	environment classesDo: [ :each | 
		aBlock value: each.
		enumerated add: each].
	orEnvironment classesDo: [ :each | 
		(enumerated includes: each) 
			ifFalse: [ aBlock value: each ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>definesClass: aClass [
	^ (environment definesClass: aClass) or: [ 
		orEnvironment definesClass: aClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>includesCategory: aCategory  [
	^ (environment includesCategory: aCategory)
		or: [ orEnvironment includesCategory: aCategory ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>includesClass: aClass [
	(environment includesClass: aClass) ifTrue: [ ^ true ].
	(orEnvironment includesClass: aClass) ifTrue: [ ^ true ].
	(environment selectorsForClass: aClass) isEmpty ifFalse: [ ^ true ].
	(orEnvironment selectorsForClass: aClass) isEmpty ifFalse: [ ^ true ].
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>includesProtocol: aProtocol in: aClass [
	^ (environment includesProtocol: aProtocol in: aClass)
		or: [ orEnvironment includesProtocol: aProtocol in: aClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>includesSelector: aSelector in: aClass [
	^ (environment includesSelector: aSelector in: aClass)
		or: [ orEnvironment includesSelector: aSelector in: aClass ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>orEnvironment: aBrowserEnvironment  [
	orEnvironment := aBrowserEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>packages [
	^ environment packages | orEnvironment packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>selectionIntervalFor: aString [
	^ (environment selectionIntervalFor: aString)
		ifNil: [ orEnvironment selectionIntervalFor: aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>selectorsForClass: aClass do: aBlock [
	| enumerated |
	enumerated := IdentitySet new.
	environment
		selectorsForClass: aClass
		do: [ :each | 
			enumerated add: each.
			aBlock value: each ].
	orEnvironment
		selectorsForClass: aClass
		do: [:each | 
			(enumerated includes: each) 
				ifFalse: [ aBlock value: each ] ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBOrEnvironment>>storeOn: aStream  [
	aStream nextPut: $(.
	environment storeOn: aStream.
	aStream nextPutAll: ' | '.
	orEnvironment storeOn: aStream.
	aStream nextPut: $)
]
