"
A PDCompositeDependency is a composite dependency. A composite pattern is using.

Actually in all case this dependency contains the dependencies between two packages and the instance variable dependencies contains all the type of dependencies (Extension, Inheritance, Reference, Trait).
"
Class {
	#name : #DACompositeDependency,
	#superclass : #DAPackageDependency,
	#instVars : [
		'dependencies'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'BaptisteQuide 7/11/2014 14:40'
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>add: aDependency [
	dependencies add: aDependency
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>containsOnlyExtensionDependency [
	(self dependencies isEmpty ) ifTrue: [ ^ false ].
	 ^ self dependencies allSatisfy: [ :dependency | dependency isExtensionDependency ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>dependencies [
	^ dependencies
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>dependenciesFrom: aClass [
	
	^ dependencies select: [ :reference | reference theClass = aClass ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>dependenciesWithoutExtensionDependency [
	^ dependencies reject: [ :dependency | dependency isExtensionDependency ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>extensionDependencies [
 	^ dependencies select: [ :each | each isExtensionDependency ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>extensionDependenciesSize [
	^ self dependencies
		detectSum: [ :dependency | 
			dependency isExtensionDependency
				ifTrue: [ 1 ]
				ifFalse: [ 0 ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>initializeFrom: aSourcePackage to: aTargetPackage [

	super initializeFrom: aSourcePackage to: aTargetPackage.
	dependencies := OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>numberOfDependencies [
	^ dependencies size
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>printReasonOn: aStream [
	aStream nextPutAll: dependencies size asString; nextPutAll: ' dependencies: '.
	dependencies
		do: [ :each | each printReasonOn: aStream ]
		separatedBy: [ aStream nextPutAll: ', ' ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>printShortReasonOn: aStream [
	aStream nextPutAll: dependencies size asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>referenceDependencies [
 	^ dependencies select: [ :each | each isReferenceDependency ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
DACompositeDependency>>referenceDependenciesFrom: aClass [
	| references |
	references := self referenceDependencies.
	
	^ references select: [ :reference | reference theClass = aClass ].
]
