Extension {
	#name : #MCDirectoryRepository
}

{
	#category : #'*GT-SpotterExtensions-Core',
	#timestamp : ' 8/31/2017 05:26:36'
}
MCDirectoryRepository>>gtDisplayOn: aStream [
	aStream nextPutAll: self description
]
