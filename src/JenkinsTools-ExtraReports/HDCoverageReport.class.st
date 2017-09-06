"
Hudson report for test coverage
"
Class {
	#name : #HDCoverageReport,
	#superclass : #HDTestReport,
	#instVars : [
		'packages',
		'wrappers',
		'covered'
	],
	#category : #JenkinsTools-ExtraReports,
	#timestamp : 'TorstenBergmann 2/12/2014 22:31'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>addTestsIn: aTestAsserter to: aSet [
	(aTestAsserter isKindOf: TestSuite) ifTrue: [
		aTestAsserter tests
			do: [ :each | self addTestsIn: each to: aSet ] ].
	(aTestAsserter isKindOf: TestCase) ifTrue: [
		(aTestAsserter class respondsTo: #packageNamesUnderTest) ifTrue: [
			aTestAsserter class packageNamesUnderTest
				do: [ :each | aSet add: (RPackage organizer packageNamed: each) ] ] ].
	^ aSet
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generate [
	| coverage |
	covered := (wrappers select: [ :each | each hasRun ])
		collect: [ :each | each reference ].
	coverage := StandardFileStream 
		forceNewFileNamed: suite name , '-Coverage.xml'.
	[ self generateOn: coverage ]
		ensure: [ coverage close ]
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generateDataOn: aStream [
	| items |
	aStream tab; nextPutAll: '<data>'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<all name="all classes">'; nextPut: Character lf.
	self
		generateType: 'class' indent: 3
		total: (items := (packages flatCollect: [ :each | each classes ]) asSet) size
		actual: ((covered collect: [ :each | each actualClass theNonMetaClass ]) asSet
			count: [ :each | items includes: each ])
		on: aStream.
	self
		generateType: 'method' indent: 3
		total: (items := (packages flatCollect: [ :each | each methods ]) asSet) size 
		actual: (covered count: [ :each | items includes: each ])
		on: aStream.
	packages do: [ :each | self generatePackage: each on: aStream ].
	aStream tab; tab; nextPutAll: '</all>'; nextPut: Character lf.
	aStream tab; nextPutAll: '</data>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generateOn: aStream [
	aStream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; nextPut: Character lf.
	aStream nextPutAll: '<report>'; nextPut: Character lf.
	self generateStatsOn: aStream.
	self generateDataOn: aStream.
	aStream nextPutAll: '</report>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generatePackage: aPackage class: aClass on: aStream [
	| items |
	aStream tab: 4; nextPutAll: '<class name="'; nextPutAll: (self encode: aClass name); nextPutAll: '">'; nextPut: Character lf.
	self
		generateType: 'class' indent: 5
		total: 1
		actual: ((covered anySatisfy: [ :each | each actualClass theNonMetaClass = aClass ])
			ifTrue: [ 1 ] ifFalse: [ 0 ])
		on: aStream.
	self
		generateType: 'method' indent: 5
		total: (items := aPackage coreMethodsForClass: aClass) size
		actual: (covered count: [ :each | items includes: each ])
		on: aStream.
	items do: [ :each | self generatePackage: each method: each on: aStream ].	
	aStream tab: 4; nextPutAll: '</class>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generatePackage: aPackage method: aReference on: aStream [
	| items |
	aStream tab: 5; nextPutAll: '<method name="'; nextPutAll: (self encode: aReference selector); nextPutAll: '">'; nextPut: Character lf.
	self
		generateType: 'method' indent: 6
		total: 1
		actual: ((covered includes: aReference) ifTrue: [ 1 ] ifFalse: [ 0 ])
		on: aStream.
	aStream tab: 5; nextPutAll: '</method>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generatePackage: aPackage on: aStream [
	| items |
	aStream tab: 3; nextPutAll: '<package name="'; nextPutAll: (self encode: (aPackage packageName copyReplaceAll: '-' with: '.')); nextPutAll: '">'; nextPut: Character lf.
	self
		generateType: 'class' indent: 4
		total: (items := aPackage classes asSet) size
		actual: ((covered collect: [ :each | each actualClass theNonMetaClass ]) asSet
			count: [ :each | items includes: each ])
		on: aStream.
	self
		generateType: 'method' indent: 4
		total: (items := aPackage methods asSet) size
		actual: (covered count: [ :each | items includes: each ])
		on: aStream.
	aPackage classes 
		do: [ :class | self generatePackage: aPackage class: class on: aStream ].
	aStream tab: 3; nextPutAll: '</package>'; nextPut: Character lf
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generateStatsOn: aStream [
	aStream tab; nextPutAll: '<stats>'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<packages value="'; print: (packages size); nextPutAll: '"/>'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<classes value="'; print: (packages detectSum: [ :each | each classes size ]); nextPutAll: '"/>'; nextPut: Character lf.
	aStream tab; tab; nextPutAll: '<methods value="'; print: (packages detectSum: [ :each | each methods size ]); nextPutAll: '"/>'; nextPut: Character lf.
	aStream tab; nextPutAll: '</stats>'; nextPut: Character lf.
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>generateType: aString indent: anInteger total: totalInteger actual: actualInteger on: aStream [
	aStream tab: anInteger; 
		nextPutAll: '<coverage type="'; nextPutAll: aString; 
		nextPutAll: ', %" value="'; print: (totalInteger = 0 ifTrue: [ 0 ] ifFalse: [ (100.0 * actualInteger / totalInteger) rounded ]); 
		nextPutAll: '% ('; print: actualInteger; nextPut: $/; print: totalInteger; nextPutAll: ')"/>'; 
		nextPut: Character lf
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>ignoredSelectors [
	^ #(packageNamesUnderTest classNamesNotUnderTest)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>methodsIn: aPackage [
	aPackage ifNil: [ ^ #() ].
	^ aPackage methods reject: [ :method | 
		(self ignoredSelectors includes: method selector)
			or: [ method compiledMethod isAbstract
			or: [ method compiledMethod refersToLiteral: #ignoreForCoverage ] ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>packagesIn: aTestAsserter [
	^ self addTestsIn: aTestAsserter to: Set new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>setUp [
	super setUp.
	wrappers := ((packages := self packagesIn: suite)
		flatCollect: [ :package | self methodsIn: package ])
		collect: [ :each | HDTestCoverage on: each ].
	wrappers do: [ :each | each install ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDCoverageReport>>tearDown [
	wrappers do: [ :each | each uninstall ].
	super tearDown.
	self generate
]
