"
SUnit tests for a single file system tree (depth one)
"
Class {
	#name : #SingleTreeTest,
	#superclass : #FileSystemTreeTest,
	#instVars : [
		'filesystem'
	],
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:40'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SingleTreeTest class>>isAbstract [
	^ self name = #SingleTreeTest
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
SingleTreeTest>>createDirectory: aString  [
	filesystem createDirectory: (filesystem pathFromString: aString)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
SingleTreeTest>>createFile: aString  [
	filesystem store createFile: (filesystem pathFromString: aString)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
SingleTreeTest>>setUp [
	super setUp.
	filesystem := FileSystem memory.
	
]
