Extension {
	#name : #OSPlatform
}

{
	#category : #'*System-Sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
OSPlatform>>potentialLocationsOfSourcesFile [
	"Return a collection of directories where the PharoVXX.sources should be searched."
	^ self subclassResponsibility
]
