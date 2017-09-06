"
Warning signaled when a dependency manually declared has no match in potential dependencies.
"
Class {
	#name : #PotentialOutDatedDependencyWarning,
	#superclass : #Warning,
	#instVars : [
		'package',
		'dependency'
	],
	#category : #Tool-DependencyAnalyser-Core,
	#timestamp : 'ChristopheDemarey 9/4/2015 14:26'
}

{
	#category : #signaling,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning class>>signalDependency: dependencyName on: aPackageName [
	^ self basicNew 
		initializeWithDependency: dependencyName on: aPackageName;
		signal;
		yourself
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning>>= anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ (package == anObject package) and: [ dependency == anObject dependency ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning>>dependency [
	^ dependency
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning>>hash [
	^ package hash bitXor: dependency hash
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning>>initializeWithDependency: aDependencyName on: aPackageName  [
	dependency := aDependencyName.
	package := aPackageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning>>messageText [
	^ messageText 
		ifNil: [ package , ': ' , dependency , ' dependency declared in the package Manifest as manuallyResolvedDependencies not detected as a dependency!' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
PotentialOutDatedDependencyWarning>>package [
	^ package
]
