"
SUnit tests for MBPackageInfo in Versionner
"
Class {
	#name : #MBPackageInfoTest,
	#superclass : #MBInfoTest,
	#instVars : [
		'package',
		'browser'
	],
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:17'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfoTest>>setUp [
"	(Smalltalk includesKey: #TMPClass)
		ifTrue: [ (Smalltalk at: #TMPClass) removeFromSystem ].
"		
"	Smalltalk organization removeCategory: 'FooBarZork'."
	(MCPackage named: 'FooBarZork') unload.
	RPackageOrganizer default unregisterPackageNamed: 'FooBarZork'.

	package := MBPackageInfo named: 'FooBarZork'.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfoTest>>tearDown [
"	(Smalltalk includesKey: #TMPClass)
		ifTrue: [ (Smalltalk at: #TMPClass) removeFromSystem ].
"
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfoTest>>testInstantiation [
	self should: [ MBPackageInfo new ] raise: Error.

	self should: [ MBPackageInfo named: #'FooBar' ] raise: AssertionFailure.
	self shouldnt: [ MBPackageInfo named: 'FooBar' ] raise: Error.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfoTest>>testIsDirty [
	"This test is likely to be bogus ... cannot just create a package for packages that don'e exist. see Metacello Issue 113"
	
	| cls |
	self deny: (package isDirty).
	self assert: (package printString =  'FooBarZork ---').
	
	"We create a class"		
	self deny: (Smalltalk includesKey: #TMPClass).
	cls := Object subclass: #TMPClass
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'FooBarZork'.
		
	self assert: (package isDirty).
	"self assert: (package printString =  'FooBarZork ---')."

	(Smalltalk includesKey: #TMPClass)
		ifTrue: [ (Smalltalk at: #TMPClass) removeFromSystem ].

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfoTest>>testPrintOn [
	self assert: (package printString =  'FooBarZork ---').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageInfoTest>>testWorkingCopy [

	|  workingCopy |
	self assert: (RPackageOrganizer default packageNamed: 'FooBarZork' ifAbsent: []) isNil.	
	package := MBPackageInfo named: 'FooBarZork'.
	workingCopy := package workingCopy.
	"creating a packageInfo for a package that is not currently loaded can create problems. see Metacello Issue 113"
	self assert: workingCopy isNil.

]
