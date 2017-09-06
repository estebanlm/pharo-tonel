Extension {
	#name : #MCRepository
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCRepository>>gtDisplayOn: aStream [
	aStream nextPutAll: self description
]
