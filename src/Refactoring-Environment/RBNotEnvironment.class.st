"
I am the complement of RBEnvironments, a logical NOT. That is: 
entity A is in this environment if it is in NOT in the environment I am constructed from.

Do not construct instances of me directly, use method #not for an existing environment:
env1 not -> a RBNotEnvironment.
"
Class {
	#name : #RBNotEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:23'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>definesClass: aClass  [
	^ (environment definesClass: aClass) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>includesCategory: aCategory  [
	^(self classNamesFor: aCategory) isEmpty not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>includesClass: aClass  [
	(environment includesClass: aClass) ifFalse: [^true].
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>includesPackage: aRPackage  [
	^ (environment includesPackage: aRPackage) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>includesProtocol: aProtocol in: aClass  [
	^(aClass organization protocolOrganizer getProtocolNamed: aProtocol ifNone: [ ^ false ])
		methods anySatisfy: [ :selector | 
			self includesSelector: selector in: aClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>includesSelector: aSelector in: aClass [
	^(environment includesSelector: aSelector in: aClass) not
]

{
	#category : #environments,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>not [
	^environment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>packages [
	^ self rootEnvironment packages 
		select: [ :package | self includesPackage: package ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBNotEnvironment>>storeOn: aStream [
	environment storeOn: aStream.
	aStream nextPutAll: ' not'
]
