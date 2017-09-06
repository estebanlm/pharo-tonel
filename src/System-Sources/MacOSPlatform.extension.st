Extension {
	#name : #MacOSPlatform
}

{
	#category : #'*System-Sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
MacOSPlatform>>potentialLocationsOfSourcesFile [
	^ {
		"Take care of .app that have a 'Resources' folder as a sibling of the vm binary"
		Smalltalk vm fullPath asFileReference parent parent / 'Resources'.
		Smalltalk vm directory.
		Smalltalk vm fullPath asFileReference parent.
		FileLocator systemApplicationSupport.
		FileLocator userApplicationSupport.
	}
]
