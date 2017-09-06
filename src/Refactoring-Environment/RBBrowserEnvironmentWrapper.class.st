"
I am a wrapper around special browser environment subclasses and
the base RBBrowserEnvironment class. I define common methods
for my subclasses to act as a full environment.
no public use.
"
Class {
	#name : #RBBrowserEnvironmentWrapper,
	#superclass : #RBBrowserEnvironment,
	#instVars : [
		'environment'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper class>>new [
	^ self onEnvironment: RBBrowserEnvironment new
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper class>>onEnvironment: anEnvironment  [
	^(self basicNew)
		initialize;
		onEnvironment: anEnvironment;
		yourself
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>definesClass: aClass [
	^ environment definesClass: aClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>environment [
	^ environment
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>includesCategory: aCategory [
	^environment includesCategory: aCategory
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>includesClass: aClass [
	^environment includesClass: aClass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>includesPackage: aRPackage  [
	^ self packages includes: aRPackage
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>includesProtocol: aProtocol in: aClass [
	^(self includesClass: aClass)
		and: [environment includesProtocol: aProtocol in: aClass]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>includesSelector: aSelector in: aClass [
	^(self includesClass: aClass)
		and: [environment includesSelector: aSelector in: aClass]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>isEmpty [
	self classesDo: [:each | ^false].
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>isSystem [
	^false
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>onEnvironment: anEnvironment [
	environment := anEnvironment
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>packageNames [
	^ self packages collect: [ :each | each packageName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>packages [

	^ self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>rootEnvironment [
	^ environment rootEnvironment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>selectionIntervalFor: aString  [
	| interval |
	interval := super selectionIntervalFor: aString.
	^interval notNil 
		ifTrue: [interval]
		ifFalse: [environment selectionIntervalFor: aString]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>storeOn: aStream  [
	aStream
		nextPutAll: '(';
		nextPutAll: self class name;
		nextPutAll: ' onEnvironment: '.
	environment storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBBrowserEnvironmentWrapper>>systemDictionary [
	^ environment systemDictionary
]
