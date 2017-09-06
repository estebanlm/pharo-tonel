"
Update the configuration from the version contained in its repository.
"
Class {
	#name : #VSUpdateFromItsRepositoryCommand,
	#superclass : #VSConfigurationCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSUpdateFromItsRepositoryCommand>>execute [
	"use the Metacello api"

	target project updateProject.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSUpdateFromItsRepositoryCommand>>title [
	^ 'update from its repository'
]
