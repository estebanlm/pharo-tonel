"
SUnit tests for InteractiveResolver
"
Class {
	#name : #InteractiveResolverTest,
	#superclass : #FileSystemResolverTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:36'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
InteractiveResolverTest>>createResolver [
	^ InteractiveResolver new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:29'
}
InteractiveResolverTest>>home [
	^ FileLocator imageDirectory resolve
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
InteractiveResolverTest>>testCached [
	[ resolver resolve: #home ]
		on: ResolutionRequest
		do: [ :req | req resume: self home ].
	self assertOriginResolves: #home
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
InteractiveResolverTest>>testNew [
	[self assertOriginResolves: #home]
		on: ResolutionRequest
		do: [:req | req resume: self home].
	
]
