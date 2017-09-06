"
SUnit tests for FileSystemResolver
"
Class {
	#name : #FileSystemResolverTest,
	#superclass : #TestCase,
	#instVars : [
		'resolver'
	],
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:35'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemResolverTest class>>isAbstract [
	^ self name = #FileSystemResolverTest
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemResolverTest>>assertOriginResolves: aSymbol [
	| reference |
	reference := resolver resolve: aSymbol.
	self assert: (reference isKindOf: FileReference).
	self assert: reference isAbsolute.
	self assert: reference exists.
	^ reference
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemResolverTest>>createResolver [
	self subclassResponsibility 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemResolverTest>>setUp [
	resolver := self createResolver.
]
