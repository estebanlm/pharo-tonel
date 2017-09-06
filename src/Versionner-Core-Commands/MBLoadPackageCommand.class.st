"
Command to load a package in versionner
"
Class {
	#name : #MBLoadPackageCommand,
	#superclass : #MBAbstractPackageCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:06'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadPackageCommand>>documentation [
	^ 'Perform a project load using the specified package or project as the load list.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadPackageCommand>>execute [
	| answer |
	answer := self uiManager confirm: 'Are you sure you want to load using ', target packageName.
	answer ifTrue:  [ | version |
		version := target configurationInfo currentVersion.
		version load: version defaultPackageNamesToLoad, { target packageName } ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadPackageCommand>>title [
	^ 'load ', target typeLabel
]
