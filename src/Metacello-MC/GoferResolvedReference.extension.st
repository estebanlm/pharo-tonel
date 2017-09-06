Extension {
	#name : #GoferResolvedReference
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
GoferResolvedReference>>asMetacelloCachingResolvedReference [

	^MetacelloCachingGoferResolvedReference name: self name repository: self repository
]
