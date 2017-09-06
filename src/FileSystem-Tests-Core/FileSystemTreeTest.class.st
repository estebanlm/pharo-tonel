"
SUnit tests for a file system tree
"
Class {
	#name : #FileSystemTreeTest,
	#superclass : #TestCase,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:39'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemTreeTest class>>isAbstract [
	^ self name = #FileSystemTreeTest
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemTreeTest>>createDirectory: aString [
	self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemTreeTest>>createFile: aString [
	self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
FileSystemTreeTest>>setUpGreek [
	self 
		createDirectory: '/alpha';
		createDirectory: '/alpha/beta';
		createFile: '/alpha/beta/gamma';
		createFile: '/alpha/beta/delta';
		createDirectory: '/alpha/epsilon';
		createFile: '/alpha/epsilon/zeta'
]
