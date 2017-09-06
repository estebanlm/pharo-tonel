Extension {
	#name : #ZnUrlTests
}

{
	#category : #'*zinc-tests',
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnUrlTests>>testRetrieveContents [
	| numbers |
	numbers := 'http://zn.stfx.eu/zn/numbers.txt' asZnUrl retrieveContents.
	numbers := numbers lines collect: [ :each | each asInteger ].
	self assert: (numbers allSatisfy: [ :each | each isInteger ]).
	self should: [ 'http://zn.stfx.eu/zn/numbers-wrong.txt' asZnUrl retrieveContents ] raise: Error
]

{
	#category : #'*zinc-tests',
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnUrlTests>>testSaveContentsToFile [
	| url target result numbers |
	url := 'http://zn.stfx.eu/zn/numbers.txt' asZnUrl.
	target := Path * 'numbers.txt'.
	ZnFileSystemUtils deleteIfExists: target .
	result := url saveContentsToFile: target.
	self assert: result exists.
	numbers := result readStreamDo: [ :in | in upToEnd ].
	numbers := numbers lines collect: [ :each | each asInteger ].
	self assert: (numbers allSatisfy: [ :each | each isInteger ]).
	ZnFileSystemUtils deleteIfExists: result 
]
