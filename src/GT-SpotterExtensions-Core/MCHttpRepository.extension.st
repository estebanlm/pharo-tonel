Extension {
	#name : #MCHttpRepository
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCHttpRepository>>gtDisplayOn: aStream [
	aStream nextPutAll: self location
]
