Extension {
	#name : #MCRepositoryGroup
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCRepositoryGroup>>remotes [
	^ self repositories reject: [ :each | each isCache ]
]
