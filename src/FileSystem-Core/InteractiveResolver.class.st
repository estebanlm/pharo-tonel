"
I resolve origins by consulting the user. I maintain a cache of the user's responses.
"
Class {
	#name : #InteractiveResolver,
	#superclass : #FileSystemResolver,
	#instVars : [
		'cache'
	],
	#category : #FileSystem-Core-Implementation,
	#timestamp : 'cwp 11/18/2009 11:56'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:22'
}
InteractiveResolver>>flushLocalCache [
	cache := IdentityDictionary new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:22'
}
InteractiveResolver>>initialize [
	self flushLocalCache
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:16:22'
}
InteractiveResolver>>resolve: origin [
	^ cache at: origin ifAbsent: [self unknownOrigin: origin]
	

]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 07:16:22'
}
InteractiveResolver>>unknownOrigin: origin [
	| reference |
	^ (next ifNotNil: [next resolve: origin]) ifNil: 
			[reference := ResolutionRequest for: origin.
			reference ifNotNil: [cache at: origin put: reference]]
]
