"
Common superclass for tests of guidance through the filesystem
"
Class {
	#name : #GuideTest,
	#superclass : #SingleTreeTest,
	#instVars : [
		'guide',
		'visited'
	],
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:43'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
GuideTest class>>isAbstract [
	^ self name = #GuideTest
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:29'
}
GuideTest>>assertVisitedIs: anArray [
	visited with: anArray do:
		[:entry :basename | 
		self assert: entry reference basename = basename]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
GuideTest>>setUp [
	visited := OrderedCollection new.
	filesystem := FileSystem memory.
	self setUpGreek
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:29'
}
GuideTest>>visitDirectory: aReference [
	visited add: aReference.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:29'
}
GuideTest>>visitFile: aReference [
	visited add: aReference.
]
