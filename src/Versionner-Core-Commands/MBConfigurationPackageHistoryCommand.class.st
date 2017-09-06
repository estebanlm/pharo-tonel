"
Command to browse package history for configurations in versionner
"
Class {
	#name : #MBConfigurationPackageHistoryCommand,
	#superclass : #MBConfigurationInfoCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:07'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationPackageHistoryCommand>>documentation [
	^ 'view package history'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationPackageHistoryCommand>>execute [
	self browseVersionHistory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationPackageHistoryCommand>>title [
	^ 'history'
]
