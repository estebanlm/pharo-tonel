"
Command to browse a package in versionner
"
Class {
	#name : #MBBrowsePackageCommand,
	#superclass : #MBAbstractPackageCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:05'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBBrowsePackageCommand>>documentation [
	^ 'Open a system browser on the selected project configuration or package.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBBrowsePackageCommand>>execute [
	target classForBrowsing browse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBBrowsePackageCommand>>title [
	^ 'browse'
]
