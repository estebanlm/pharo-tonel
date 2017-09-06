"

"
Class {
	#name : #SystemNavigationOnNewlyCreatedEnvironmentTest,
	#superclass : #SystemNavigationTest,
	#category : #Tests-System,
	#timestamp : ''
}

{
	#category : #'building suites',
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemNavigationOnNewlyCreatedEnvironmentTest class>>shouldInheritSelectors [

^true
]

{
	#category : #setUp-tearDown,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemNavigationOnNewlyCreatedEnvironmentTest>>createSystemNavigationToTest [
	
	| environment nav |
	environment := SystemDictionary withOrganizer: SystemOrganizer new.
	nav := SystemNavigation new.
	nav environment: environment.
	^nav
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemNavigationOnNewlyCreatedEnvironmentTest>>testAllReferencesToPool [
	| result |
	
	result := self systemNavigationToTest allReferencesToPool: FooSharedPool.
	self assert: result isEmpty. "FooSharedPool is not in this environment"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemNavigationOnNewlyCreatedEnvironmentTest>>testEnsureDefaultEnvironmentNotUsed [
	
	| allClasses originalProtoObjectClass originalObjectClass anotherObjectClass |
	allClasses := self systemNavigationToTest allClasses.
	self assert: allClasses isEmpty.
	originalProtoObjectClass := Smalltalk globals at: #ProtoObject.		
	originalObjectClass := Smalltalk globals at: #Object.
	
	DangerousClassNotifier disableDuring: [
		anotherObjectClass := self classFactory newClassNamed: #Object subclassOf: originalProtoObjectClass instanceVariableNames: '' classVariableNames:  'DependentsFields'].
	
	self assert: ((self environmentToTest at: #Object) = anotherObjectClass).
	self assert: ((Smalltalk globals at: #Object) = originalObjectClass).
	
]
