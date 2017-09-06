Extension {
	#name : #UnixPlatform
}

{
	#category : #'*System-Sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
UnixPlatform>>potentialLocationsOfSourcesFile [
	^ { Smalltalk vm directory. FileLocator userData }
]
