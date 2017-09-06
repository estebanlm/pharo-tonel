"
Command to browse package history in versionner
"
Class {
	#name : #MBPackageHistoryCommand,
	#superclass : #MBAbstractPackageCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:06'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageHistoryCommand>>documentation [
	^ 'view package history'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageHistoryCommand>>execute [

	self browseVersionHistory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBPackageHistoryCommand>>title [
	^ 'history'
]
