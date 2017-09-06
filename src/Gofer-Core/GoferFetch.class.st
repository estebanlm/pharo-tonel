"
Fetch packages using Gofer
"
Class {
	#name : #GoferFetch,
	#superclass : #GoferSynchronize,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:31'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferFetch>>defaultModel [
	^ Set new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferFetch>>execute [
	self model
		do: [ :reference | self cacheRepository storeVersion: reference version ]
		displayingProgress: 'Fetching Versions'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferFetch>>initializeOn: aGofer [
	super initializeOn: aGofer.
	self gofer references do: [ :reference |
		self gofer allResolved do: [ :resolved |
			((reference matches: resolved) and: [ (cacheReferences includes: resolved) not ])
				ifTrue: [ self model add: resolved ] ] ]
]
