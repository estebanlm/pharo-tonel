"
I am a RBBrowserEnvironment on a set of packages or package names.
I containt all entities are defined in this packages.
(classes and class that have extensions from this packages)

Example:
(RBBrowserEnvironment new) forPackageNames:{ 'Morphic-Base'}.
"
Class {
	#name : #RBPackageEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'packages'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'ChristopheDemarey 9/23/2015 10:55'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment class>>onEnvironment: anEnvironment packageNames: aCollection [
	^ self 
		onEnvironment: anEnvironment
		packages: (aCollection collect: [ :each | 
			RPackageOrganizer default packageNamed: each ])
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment class>>onEnvironment: anEnvironment packages: aCollection [
	^ (self onEnvironment: anEnvironment)
		packages: aCollection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment class>>package: aPackage [
	^ self packages: { aPackage }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment class>>packageName: aName [
	^ self packageNames: { aName }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment class>>packageNames: aCollection [
	^ self 
		onEnvironment: self default
		packageNames: aCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment class>>packages: aCollection [
	^ self 
		onEnvironment: self default
		packages: aCollection
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>addPackage: aSymbol [
	packages add: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>asSelectorEnvironment [
	| result |
	result := RBSelectorEnvironment onEnvironment: environment.
	self classesAndSelectorsDo: [ :class :selector | result addClass: class selector: selector ].
	^ result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>classesAndSelectorsDo: aBlock [
	packages do: [ :package |
		package methods do: [ :method |
			(environment includesSelector: method selector in: method methodClass)
				ifTrue: [ aBlock value: method methodClass value: method selector ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>classesDo: aBlock [
	| enumerated enumerator |
	enumerated := IdentitySet new.
	enumerator := [ :each |
		(enumerated includes: each) ifFalse: [
			(environment includesClass: each)
				ifTrue: [ aBlock value: each ].
			(environment includesClass: each theMetaClass)
				ifTrue: [ aBlock value: each theMetaClass].
			enumerated add: each ] ].
	packages do: [ :package |
		package classes do: enumerator.
		package extensionClasses do: enumerator ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>definesClass: aClass [
	^ (super definesClass: aClass) and: [ self packages anySatisfy: [ :package | package includesClass: aClass ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>includesCategory: aCategory [
	^ (super includesCategory: aCategory) and: [ 
		self packages anySatisfy: [ :package | 
			package includesSystemCategory: aCategory ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>includesClass: aClass [
	^ (super includesClass: aClass) and: [ 
		self packages anySatisfy: [ :package | 
			(package includesClass: aClass) or: [ 
			(package extensionCategoriesForClass: aClass) notEmpty ]]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>includesProtocol: aProtocol in: aClass [
	^ (environment includesProtocol: aProtocol in: aClass) and: [ self packages anySatisfy: [ :package | package includesMethodCategory: aProtocol ofClass: aClass ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>includesSelector: aSelector in: aClass [
	^ (environment includesSelector: aSelector in: aClass) 
		and: [ self packages anySatisfy: [ :package | 
				package includesSelector: aSelector ofClass: aClass ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>initialize [
	super initialize.
	packages := Set new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>packageNames [
	^ packages collect: [ :each | each packageName ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>packages [
	^ packages
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>packages: aCollection [
	packages addAll: aCollection
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>postCopy [
	super postCopy.
	packages := packages copy
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>printOn: aStream  [
	self storeOn: aStream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBPackageEnvironment>>storeOn: aStream  [
	aStream nextPut: $(; nextPutAll: self class name; nextPutAll: ' onEnvironment: '.
	environment storeOn: aStream.
	aStream nextPutAll: ' packageNames: '.
	self packageNames asArray storeOn: aStream.
	aStream nextPut: $)
]
