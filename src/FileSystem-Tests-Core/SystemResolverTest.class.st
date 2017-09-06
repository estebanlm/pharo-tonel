"
SUnit tests for SystemResolver
"
Class {
	#name : #SystemResolverTest,
	#superclass : #FileSystemResolverTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:36'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>createResolver [
	^ SystemResolver new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>testChanges [
	self assertOriginResolves: #changes
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>testImage [
	self assertOriginResolves: #image
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>testImageDirectory [
	self assertOriginResolves: #imageDirectory
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>testLocalDirectory [
	| reference |
	reference := resolver resolve: #localDirectory.
	self assert: (reference isKindOf: FileReference).
	^ reference
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>testVmBinary [
	self assertOriginResolves: #vmBinary
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
SystemResolverTest>>testVmDirectory [
	self assertOriginResolves: #vmDirectory
]
