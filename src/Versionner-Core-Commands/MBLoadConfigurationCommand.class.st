"
Command to load a configuration in Versionner
"
Class {
	#name : #MBLoadConfigurationCommand,
	#superclass : #MBDevCycleCommands,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:10'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadConfigurationCommand>>askForProjectName [
	^ self pickRepositoryFrom: self repositories title: 'Choose the repository where project is located'
]

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadConfigurationCommand>>documentation [
	^ 'Load configuration from a repository'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadConfigurationCommand>>execute [
	| projectRepository configRef configurationInfo versionInfos versionInfo version configRefMap configNames configName |
	projectRepository := self askForProjectName.
	projectRepository ifNil: [ ^ self ].
	configRefMap := self configurationReferencesFrom: projectRepository.
	
	configRefMap isEmpty
		ifTrue: [ ^ self inform: 'No configurations found in the project repository ' , projectRepository description printString ].
	configNames := configRefMap keys asSortedCollection asArray.
	configName := self uiManager 
		chooseFrom: (configNames collect: [ :name | name configurationBaseName])
		values: configNames
		title: 'Select the desired project'.
	configName ifNil: [ ^ self ].
	
	configRef := (configRefMap at: configName) asSortedCollection asArray last.
	Gofer new
		repository: projectRepository;
		version: configRef name;
		load
]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadConfigurationCommand>>order [

	^'10'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBLoadConfigurationCommand>>title [
	^ 'load configuration'
]
