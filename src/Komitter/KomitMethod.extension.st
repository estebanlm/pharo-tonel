Extension {
	#name : #KomitMethod
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>koDestinationText [
	^ operation koDestinationText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>koSourceText [
	
	^ self operation koSourceText
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitMethod>>printOn: aStream [

	super printOn: aStream.
	aStream << '[ '.
	self method selector printOn: aStream.
	aStream << ' ]'.
]
