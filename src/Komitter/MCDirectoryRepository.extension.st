Extension {
	#name : #MCDirectoryRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCDirectoryRepository>>koRemote [
	
	^ KomitDirectoryRemote new
		remote: self;
		yourself
]
