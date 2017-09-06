"
Command to browse changes on a configuration in versionner
"
Class {
	#name : #MBConfigurationChangesCommand,
	#superclass : #MBConfigurationInfoCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:07'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationChangesCommand>>documentation [
	^ 'View changes for selected configuration against version in selected repository.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationChangesCommand>>execute [
	"View the changes made in the working copy."
	
	| wc repo |
	wc := target workingCopy.
	(repo := self selectRepositoryFromWorkingCopy: wc) ifNil: [ ^self ].
	self findChangesFor: wc relativeToRepository: repo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationChangesCommand>>title [
	^ 'changes'
]
