"
An OmSessionStoreNameStrategyTest is a test class for testing the behavior of OmSessionStoreNameStrategy
"
Class {
	#name : #OmSessionStoreNameStrategyTest,
	#superclass : #TestCase,
	#instVars : [
		'strategy',
		'name'
	],
	#category : #OmbuTests,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest class>>isAbstract [

	^ self name = #OmSessionStoreNameStrategyTest
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>createFileWith: aName [

	self directory ensureCreateDirectory.
	(OmFileStore fileReferenceForStoreNamed: aName inDirectory: self directory) 
		writeStreamDo: [ :stream | stream print: 'stub contents' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>directory [

	^ 'ombu-strategy-tests' asFileReference
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>fileReferenceWith: aName [

	^ OmFileStore 
		fileReferenceForStoreNamed: aName
		inDirectory: self directory
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>setUp [

	strategy := self strategyClass new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>strategyClass [

	^ self class environment classNamed: 
		(self class name allButLast: 4) "corresponding to the word Test"
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>tearDown [

	self directory ensureDeleteAll 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>testWithExistingFile [

	self createFileWith: 'existing'.

	name := strategy nextTo: 'existing' in: self directory.
	
	self assert: name isString.
	self deny: name = 'existing'.
	self deny: (self fileReferenceWith: name) exists
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmSessionStoreNameStrategyTest>>testWithNotExistingFile [

	name := strategy nextTo: 'inexistent' in: self directory.
	
	self assert: name isString.
	self deny: (self fileReferenceWith: name) exists
]
