"
SUnit tests for PlatformResolver
"
Class {
	#name : #PlatformResolverTest,
	#superclass : #FileSystemResolverTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:36'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
PlatformResolverTest>>createResolver [
	^ PlatformResolver forCurrentPlatform
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PlatformResolverTest>>testCache [
	| cache |
	cache := self assertOriginResolves: #cache
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PlatformResolverTest>>testHome [
	| home |
	home := self assertOriginResolves: #home.
	self assert: home isDirectory
]
