Extension {
	#name : #Gofer
}

{
	#category : #'*Gofer-UI',
	#timestamp : ' 8/31/2017 05:26:43'
}
Gofer>>browseLocalChanges [
	"Browse the changes between the base version and the working copy."
	
	^ self execute: GoferBrowseLocalChanges
]

{
	#category : #'*Gofer-UI',
	#timestamp : ' 8/31/2017 05:26:43'
}
Gofer>>browseRemoteChanges [
	"Browse the changes between the working copy and the remote changes."
	
	^ self execute: GoferBrowseRemoteChanges
]
