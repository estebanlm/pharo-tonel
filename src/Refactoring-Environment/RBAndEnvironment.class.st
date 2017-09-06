"
I am the combination of two RBEnvironments, a logical AND. That is: 
entity A is in this environment if it is in BOTH environment I am constructed from.

Do not construct instances of me directly, use method #& for two existing environments:
env1 & env2 -> a RBAndEnvironment.
"
Class {
	#name : #RBAndEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'andedEnvironment'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment class>>onEnvironment: anEnvironment and: anotherEnvironment  [
	^(self onEnvironment: anEnvironment)
		andedEnvironment: anotherEnvironment;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>andedEnvironment [
	^andedEnvironment
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>andedEnvironment: aBrowserEnvironment  [
	andedEnvironment := aBrowserEnvironment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>classes [
	^ environment classes & andedEnvironment classes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>classesDo: aBlock  [
	environment 
		classesDo: [:each | (self includesClass: each) ifTrue: [aBlock value: each]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>definesClass: aClass [
	^ (environment definesClass: aClass) and: [ 
		andedEnvironment definesClass: aClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>includesCategory: aCategory  [
	^(self classNamesFor: aCategory) isEmpty not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>includesClass: aClass  [
	| doesntHaveSelectors |
	(environment includesClass: aClass) ifFalse: [^false].
	(andedEnvironment includesClass: aClass) ifFalse: [^false].
	doesntHaveSelectors := true.
	environment selectorsForClass: aClass
		do: 
			[:each | 
			doesntHaveSelectors := false.
			(andedEnvironment includesSelector: each in: aClass) ifTrue: [^true]].
	^doesntHaveSelectors
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>includesProtocol: aProtocol in: aClass  [
	^ (environment includesProtocol: aProtocol in: aClass)
		and: [ andedEnvironment includesProtocol: aProtocol in: aClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>includesSelector: aSelector in: aClass  [
	^(environment includesSelector: aSelector in: aClass) 
		and: [andedEnvironment includesSelector: aSelector in: aClass]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>packages [
	^ environment packages & andedEnvironment packages
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>printOn: aStream  [
	environment printOn: aStream.
	aStream nextPutAll: ' & '.
	andedEnvironment printOn: aStream.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>problemCount [
	^environment isClassEnvironment 
		ifTrue: [self numberClasses]
		ifFalse: [super problemCount]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>selectionIntervalFor: aString  [
	| interval |
	interval := super selectionIntervalFor: aString.
	interval notNil ifTrue: [^interval].
	^andedEnvironment selectionIntervalFor: aString

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>selectorsForClass: aClass do: aBlock  [
	environment selectorsForClass: aClass
		do: 
			[:each | 
			(andedEnvironment includesSelector: each in: aClass) 
				ifTrue: [aBlock value: each]]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBAndEnvironment>>storeOn: aStream  [
	aStream nextPut: $(.
	environment storeOn: aStream.
	aStream nextPutAll: ' & '.
	andedEnvironment storeOn: aStream.
	aStream nextPut: $)
]
