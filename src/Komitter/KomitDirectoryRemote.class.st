"
I encapsulate a gemstone repository
"
Class {
	#name : #KomitDirectoryRemote,
	#superclass : #KomitRemote,
	#category : #Komitter-Models,
	#timestamp : '<historical>'
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
