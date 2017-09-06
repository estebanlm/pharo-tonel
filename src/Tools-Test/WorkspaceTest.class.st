"
SUnit tests for Workspace
"
Class {
	#name : #WorkspaceTest,
	#superclass : #TestCase,
	#category : #Tools-Test-Base,
	#timestamp : 'TorstenBergmann 2/4/2014 20:47'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
WorkspaceTest>>testEmptyContent [

	self assert: (Workspace new contents isEmpty)
]
