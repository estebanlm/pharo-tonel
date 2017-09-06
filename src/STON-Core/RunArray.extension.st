Extension {
	#name : #RunArray
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
RunArray class>>fromSton: stonReader [
	^ self new
		fromSton: stonReader;
		yourself
]
