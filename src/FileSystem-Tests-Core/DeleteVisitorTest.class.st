"
SUnit tests for class DeleteVisitor
"
Class {
	#name : #DeleteVisitorTest,
	#superclass : #SingleTreeTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:42'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
DeleteVisitorTest>>testBeta [
	self setUpGreek.
	DeleteVisitor delete: (filesystem / 'alpha' / 'beta').
	self assert: (filesystem isDirectory: '/alpha').
	self assert: (filesystem isDirectory: '/alpha/epsilon').
	self deny: (filesystem exists: '/alpha/beta').
	
]
