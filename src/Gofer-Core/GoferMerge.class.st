"
Merge work
"
Class {
	#name : #GoferMerge,
	#superclass : #GoferUpdate,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMerge>>defaultModel [
	^ MCVersionMerger new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferMerge>>execute [
	[ self model merge ]
		on: MCMergeResolutionRequest
		do: [ :request |  request autoMerge ].
	self gofer cleanup
]
