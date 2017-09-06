"
Push a version
"
Class {
	#name : #GoferPush,
	#superclass : #GoferSynchronize,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:32'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferPush>>defaultModel [
	^ OrderedCollection new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferPush>>execute [
	self model 
		do: [ :assocation | assocation value storeVersion: assocation key version ]
		displayingProgress: 'Pushing Versions'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferPush>>initializeOn: aGofer [
	super initializeOn: aGofer.
	self gofer references do: [ :reference |
		cacheReferences do: [ :resolved |
			(reference matches: resolved) ifTrue: [
				self gofer repositories do: [ :repository |
					((self gofer allResolvedIn: repository) includes: resolved)
						ifFalse: [ self model add: resolved -> repository ] ] ] ] ]
]
