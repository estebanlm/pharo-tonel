"
Synchronize repos 
"
Class {
	#name : #GoferSynchronize,
	#superclass : #GoferOperation,
	#instVars : [
		'cacheReferences'
	],
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferSynchronize>>cacheRepository [
	^ MCCacheRepository uniqueInstance
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferSynchronize>>initializeOn: aGofer [
	super initializeOn: aGofer disablePackageCache.
	MCFileBasedRepository flushAllCaches.
	cacheReferences := self gofer allResolvedIn: self cacheRepository
]
