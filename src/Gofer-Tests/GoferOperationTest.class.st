"
SUnit tests for Gofer operations
"
Class {
	#name : #GoferOperationTest,
	#superclass : #GoferTest,
	#category : #Gofer-Tests,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>allManagers [

	^ MCWorkingCopy allManagers 
	
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>hasClass: aSymbol [
	^ Smalltalk globals includesKey: aSymbol
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>hasClass: aSymbol selector: aSelector [
	^ (Smalltalk globals classNamed: aSymbol) includesSelector: aSelector
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>hasPackage: aString [
	^ self allManagers anySatisfy: [ :package | package packageName = aString ]
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>hasVersion: aString [
	^ self allManagers anySatisfy: [ :version | version ancestry ancestorString = aString ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>runCase [
	^ "SystemAnnouncer uniqueInstance suspendAllWhile: [ "super runCase "]"
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>setUp [
	super setUp.
	gofer repository: self monticelloRepository
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>tearDown [
	(self hasPackage: 'GoferFoo')
		ifTrue: [ Gofer new package: 'GoferFoo'; unload ].
	(self hasPackage: 'GoferBar')
		ifTrue: [ Gofer new package: 'GoferBar'; unload ].
	(self hasPackage: 'ConfigurationOfGoferFoo')
		ifTrue: [ Gofer new package: 'ConfigurationOfGoferFoo'; unload ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testCleanup [
	| class |
	gofer
		package: 'GoferFoo';
		load.
	class := Smalltalk globals classNamed: #GoferFoo.
	Smalltalk globals organization addCategory: #'GoferFoo-Empty'.
	class organization addCategory: #empty.
	class class organization addCategory: #empty.
	gofer cleanup.
	self deny: (Smalltalk organization categories includes: #'GoferFoo-Empty').
	self deny: (class organization categories includes: #'GoferFoo-Empty').
	self deny: (class class organization categories includes: #'GoferFoo-Empty')
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testCommit [
	| repository |
	repository := MCDictionaryRepository new.
	gofer
		package: 'GoferFoo';
		load.
	gofer := Gofer new.
	gofer disablePackageCache.
	gofer repository: repository.
	gofer package: 'GoferFoo'.
	gofer commit: 'A test commit'.
	self assert: repository allVersionInfos size = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testFetch [
	gofer package: 'GoferFoo'.
	gofer fetch
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testLoad [
	gofer version: 'GoferFoo-lr.1'.
	gofer load.
	self assert: (self hasVersion: 'GoferFoo-lr.1').
	self assert: (self hasClass: #GoferFoo)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testLocalChanges [
	| changes |
	gofer
		package: 'GoferBar';
		load.
	(Smalltalk globals classNamed: #GoferBar) compile: 'foo'.
	changes := gofer localChanges.
	self assert: changes operations size = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testMerge [
	| initial |
	initial := gofer copy.
	initial
		version: 'GoferBar-jf.1';
		load.
	gofer
		package: 'GoferBar';
		load.
	(Smalltalk globals classNamed: #GoferBar) compile: 'foo'.
	[ gofer merge ]
		on: ProvideAnswerNotification
		do: [ :e | e resume: true ].
	self assert: (self hasClass: #GoferBar selector: #foo)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testPush [
	| repository |
	gofer := Gofer new.
	gofer disablePackageCache.
	gofer repository: (repository := MCDictionaryRepository new).
	gofer package: 'GoferFoo'.
	gofer push
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testRecompile [
	gofer package: 'Gofer-Core'.
	gofer recompile
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testReinitialize [
	| class |
	gofer
		package: 'GoferFoo';
		load.
	class := Smalltalk classNamed: #GoferFoo.
	class
		addClassVarNamed: #InstanceSide;
		addClassVarNamed: #ClassSide.
	class compile: 'initialize InstanceSide := true'.
	class class compile: 'initialize ClassSide := true'.
	self assert: (class classPool at: #InstanceSide) isNil.
	self assert: (class classPool at: #ClassSide) isNil.
	gofer reinitialize.
	self assert: (class classPool at: #InstanceSide) isNil.
	self assert: (class classPool at: #ClassSide)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testRemoteChanges [
	| changes |
	gofer
		package: 'GoferBar';
		load.
	(Smalltalk globals classNamed: #GoferBar) compile: 'foo'.
	changes := gofer remoteChanges.
	self assert: changes operations size = 1
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testRevert [
	gofer
		package: 'GoferFoo';
		package: 'GoferBar';
		load.
	(Smalltalk globals classNamed: #GoferBar) category: 'GoferFoo'.
	gofer revert.
	self assert: (Smalltalk globals classNamed: #GoferFoo) category asSymbol = #GoferFoo.
	self assert: (Smalltalk globals classNamed: #GoferBar) category asSymbol = #GoferBar
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testUnload [
	gofer
		package: 'GoferFoo';
		load.
	gofer unload.
	self deny: (self hasPackage: 'GoferFoo').
	self deny: (self hasClass: #GoferFoo)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferOperationTest>>testUpdate [
	| initial |
	initial := gofer copy.
	initial
		version: 'GoferFoo-lr.1';
		load.
	gofer package: 'GoferFoo'.
	gofer update.
	self assert: (self hasVersion: 'GoferFoo-lr.4')
]
