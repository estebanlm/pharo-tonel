Extension {
	#name : #KomitDirectoryRemote
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDirectoryRemote>>icon [
	^ 'DIR'
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitDirectoryRemote>>label [
	
	^ self remote directory basename
]
