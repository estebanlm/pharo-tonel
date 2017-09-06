"
SUnit tests for CopyVisitor
"
Class {
	#name : #CopyVisitorTest,
	#superclass : #FileSystemTreeTest,
	#instVars : [
		'source',
		'dest'
	],
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:39'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
CopyVisitorTest>>createDirectory: aString  [
	source createDirectory: (source store pathFromString: aString)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
CopyVisitorTest>>createFile: aString  [
	source store createFile: (source store pathFromString: aString)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
CopyVisitorTest>>setUp [
	source := FileSystem memory.
	dest := FileSystem memory.
	
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
CopyVisitorTest>>testAll [
	self setUpGreek.
	CopyVisitor 
		copy: (source / 'alpha') 
		to: (dest / 'alpha').
	self assert: (dest isDirectory: '/alpha').
	self assert: (dest isFile: '/alpha/beta/gamma').
]
