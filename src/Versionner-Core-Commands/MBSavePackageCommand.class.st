"
Command to save a package in versionner
"
Class {
	#name : #MBSavePackageCommand,
	#superclass : #MBAbstractPackageCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:06'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSavePackageCommand>>documentation [
	^ 'Save a new version of the mcz for the given repository in its repository.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSavePackageCommand>>execute [
	| message repo gofer |
	message := self uiManager multilineRequest: 'Enter commit message' initialAnswer: ''.
	message == nil
		ifTrue: [ ^ self ].
	repo := self checkUserInRepositoryOfPackage: target spec name.
	gofer := Gofer new.
	gofer disablePackageCache.
	gofer repository: repo.
	gofer package: target spec name.
	gofer commit: message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSavePackageCommand>>title [
	^ 'save'
]
