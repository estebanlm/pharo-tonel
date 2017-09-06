"
Command to add a repository in Versionner
"
Class {
	#name : #MBAddRepositoryCommand,
	#superclass : #MBDevCycleCommands,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:09'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAddRepositoryCommand>>documentation [
	^ 'Add a Monticello repository to the default repository group.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAddRepositoryCommand>>execute [

	MCTool newRepository ifNotNil:
		[:repos | MCRepositoryGroup default addRepository: repos ].


	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAddRepositoryCommand>>title [
	^ 'add repository'
]
