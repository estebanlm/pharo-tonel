"

"
Class {
	#name : #MCRepositoryTest,
	#superclass : #MCTestCase,
	#instVars : [
		'repository',
		'ancestors'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest class>>isAbstract [
	^ self = MCRepositoryTest
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>addVersion: aVersion [
	self subclassResponsibility 
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>addVersionWithSnapshot: aSnapshot name: aString [
	| version |
	version := self versionWithSnapshot: aSnapshot name: aString.
	self addVersion: version.
	^ version info
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>assertMissing: aVersionInfo [
	self assert: (repository versionWithInfo: aVersionInfo) isNil
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>assertVersionInfos: aCollection [
	self assert: repository allVersionInfos asSet = aCollection asSet
]

{
	#category : #'tests-input data',
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>homeDirectoryUrl [
	^ FileLocator home asFileReference asZnUrl
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>saveSnapshot1 [
	^ self saveSnapshot: self snapshot1 named: 'rev1'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>saveSnapshot2 [
	^ self saveSnapshot: self snapshot2 named: 'rev2'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>saveSnapshot: aSnapshot named: aString [
	| version |
	version := self versionWithSnapshot: aSnapshot name: aString.
	repository storeVersion: version.
	^ version info
	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>snapshot1 [
	^ (MCSnapshot fromDefinitions: (Array with: (MCOrganizationDefinition categories: #('y'))))
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>snapshot2 [
	^ (MCSnapshot fromDefinitions: (Array with: (MCOrganizationDefinition categories: #('x'))))
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>snapshotAt: aVersionInfo [
	^ (repository versionWithInfo: aVersionInfo) snapshot
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testAddAndLoad [
	| node |
	node := self addVersionWithSnapshot: self snapshot1 name: 'rev1'.
	self assert: (self snapshotAt: node) = self snapshot1.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateFileRepositoryFromUrl [
	repository := MCRepository fromUrl: 'file:///tmp'.
	self assert: (repository isKindOf: MCFileBasedRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateFiletreeRepositoryFromUrl [
	repository := MCRepository fromUrl: (self homeDirectoryUrl scheme: 'filetree') asString.
	self assert: (repository isKindOf: MCFileTreeRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateFiletreeRepositoryFromUrlWithRelativePath [
	repository := MCRepository fromUrl: 'filetree://.' asUrl.
	self assert: (repository isKindOf: MCFileTreeRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateFtpRepositoryFromUrl [
	repository := MCRepository fromUrl: 'ftp://ftp.example.com/examples'.
	self assert: (repository isKindOf: MCFtpRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateGitHubRepositoryFromUrl [
	repository := MCRepository fromUrl: 'github://dalehenrich/MetacelloRepository:master/monticello/repos/itory/path'.
	self assert: (repository isKindOf: MCGitHubRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateHttpRepositoryFromUrl [
	repository := MCRepository fromUrl: 'http://mydomain.com'.
	self assert: (repository isKindOf: MCHttpRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCanCreateHttpsRepositoryFromUrl [
	repository := MCRepository fromUrl: 'https://mydomain.com'.
	self assert: (repository isKindOf: MCHttpRepository) 
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testCannotCreateDictionaryRepositoryFromUrl [
	self
		should: [ MCRepository fromUrl: 'dict://foo' ]
		raise: MCRepositoryError
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testIncludesName [
	self deny: (repository includesVersionNamed: 'MonticelloTest-xxx.1-rev1').
	self saveSnapshot1.
	self assert: (repository includesVersionNamed: 'MonticelloTest-xxx.1-rev1').
	self deny: (repository includesVersionNamed: 'MonticelloTest-xxx.1-rev2').
	self saveSnapshot2.
	self assert:  (repository includesVersionNamed: 'MonticelloTest-xxx.1-rev2').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testLoadMissingNode [
	| node |
	node := MCVersionInfo new.
	self assertMissing: node
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>testStoreAndLoad [
	| node node2 |
	node := self saveSnapshot1.
	node2 := self saveSnapshot2.
	self assert: (self snapshotAt: node) = self snapshot1.
	self assert: (self snapshotAt: node2) = self snapshot2.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCRepositoryTest>>versionWithSnapshot: aSnapshot name: aString [
	| info |
	info := self mockVersionInfo: aString. 
	^ MCVersion 
		package: (MCPackage new name: aString)
		info: info
		snapshot: aSnapshot
]
