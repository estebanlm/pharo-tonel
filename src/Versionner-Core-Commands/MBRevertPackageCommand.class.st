"
Command to revert a package in versionner
"
Class {
	#name : #MBRevertPackageCommand,
	#superclass : #MBAbstractPackageCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:06'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBRevertPackageCommand>>documentation [
	^ 'Revert the changes that have been made to this package.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBRevertPackageCommand>>execute [

	self pickAncestorVersionInfo ifNotNil: [:info |
		(target workingCopy repositoryGroup versionWithInfo: info
			ifNone: [^self inform: 'No repository found for ', info name]
		) load].

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBRevertPackageCommand>>pickAncestorVersionInfo [
	| ancestors |
	ancestors := target workingCopy ancestry breadthFirstAncestors.
	^self uiManager 
		chooseFrom: (ancestors collect: [:ea | ea name])
		values: ancestors
		title: 'Package:' 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBRevertPackageCommand>>title [
	^ 'revert'
]
