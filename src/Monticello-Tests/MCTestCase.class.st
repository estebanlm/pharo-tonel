"

"
Class {
	#name : #MCTestCase,
	#superclass : #TestCase,
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase class>>isAbstract [
	^ self = MCTestCase
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase class>>isUnitTest [
	^false
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase class>>resources [
	^ Array with: MCSnapshotResource
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>assertPackage: actual matches: expected [
	self assert: actual = expected

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>assertSnapshot: actual matches: expected [
	| diff |
	diff := actual patchRelativeToBase: expected.
	self assert: diff isEmpty

]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>assertVersion: actual matches: expected [
	self assertPackage: actual package matches: expected package.	
	self assertVersionInfo: actual info matches: expected info.
	self assertSnapshot: actual snapshot matches: expected snapshot.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>assertVersionInfo: actual matches: expected [
	self assert: actual name = expected name.
	self assert: actual message = expected message.
	self assert: actual ancestors size = expected ancestors size.
	actual ancestors with: expected ancestors do: [:a :e | self assertVersionInfo: a matches: e]
	
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>change: aSelector toReturn: anObject [
	self 
		compileClass: self mockClassA 
		source: aSelector, ' ^ ', anObject printString 
		category: 'numeric'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>commentForClass: name [
	^ 'This is a comment for ', name
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>commentStampForClass: name [
	^ 'tester-', name,  ' 1/1/2000 00:00'
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>compileClass: aClass source: source category: category [
	aClass compileSilently: source classified: category
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockCategoryName [
	^ 'MonticelloMocks'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockClass: className super: superclassName [
	^ MCClassDefinition
		name:  className
		superclassName:  superclassName
		category: self mockCategoryName
		instVarNames: #()
		classVarNames: #()
		poolDictionaryNames: #()
		classInstVarNames: #()
		type: #normal
		comment: (self commentForClass: className)
		commentStamp: (self commentStampForClass: className)
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockClassA [
	^ Smalltalk globals at: #MCMockClassA
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockClassB [
	^ Smalltalk globals at: #MCMockClassB
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockDependencies [
	^ Array with: (MCVersionDependency package: self mockEmptyPackage info: (self mockVersionInfo: 'x'))
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockEmptyPackage [
	^ MCPackage named: 'Mock empty package'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockExtensionMethodCategory [
	^ '*MonticelloMocks'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockInstanceA [
	^ self mockClassA new
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockMessageString [
	^ 'A version generated for testing purposes.'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockMethod: aSymbol class: className source: sourceString meta: aBoolean [
	^ MCMethodDefinition
		className: className
		classIsMeta: aBoolean
		selector:  aSymbol
		category: 'as yet unclassified'
		timeStamp: ''
		source: sourceString
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockOverrideMethodCategory [
	^ self mockExtensionMethodCategory, '-override'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockPackage [
	^ MCSnapshotResource mockPackage
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockSnapshot [
	^ MCSnapshotResource current snapshot
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockToken: aSymbol [
	^ MCMockDefinition token: aSymbol
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersion [
	^ MCVersion 
		package: self mockPackage
		info: self mockVersionInfo
		snapshot: self mockSnapshot
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersionInfo [
	^ self treeFrom: #(d ((b ((a))) (c)))
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersionInfo: tag  [
	^ MCVersionInfo
		name: self mockVersionName, '-', tag asString
		id: UUID new
		message: self mockMessageString, '-', tag asString
		date: Date today
		time: Time now
		author: Author fullName
		ancestors: #()

]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersionInfoWithAncestor: aVersionInfo  [
	^ MCVersionInfo
		name: aVersionInfo name, '-child'
		id: UUID new
		message: self mockMessageString
		date: Date today
		time: Time now
		author: Author fullName
		ancestors: {aVersionInfo}

]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersionName [
	^ 'MonticelloTest-xxx.1'
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersionWithAncestor: aMCVersion  [
	^ MCVersion
		package: self mockPackage
		info: (self mockVersionInfoWithAncestor: aMCVersion info)
		snapshot: self mockSnapshot
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>mockVersionWithDependencies [
	^ MCVersion 
		package: self mockPackage
		info: self mockVersionInfo
		snapshot: self mockSnapshot
		dependencies: self mockDependencies
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>restoreMocks [
	self mockSnapshot updatePackage: self mockPackage
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>runCase [
	MCCacheRepository disableCacheDuring: [ ^ super runCase ].
]

{
	#category : #mocks,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCTestCase>>treeFrom: anArray [
	| name id |
	name := anArray first.
	id := '00000000-0000-0000-0000-0000000000', (name asString size = 1 ifTrue: [name asString, '0'] ifFalse: [name asString]).
	^ MCVersionInfo
		name: name
		id: (UUID fromString: id)
		message: ''
		date: nil
		time: nil
		author: ''
		ancestors: (anArray size > 1 ifTrue: [(anArray second collect: [:ea | self treeFrom: ea])] ifFalse: [#()])
]
