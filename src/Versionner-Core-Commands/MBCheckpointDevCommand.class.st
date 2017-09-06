"
Command for a check point in Versionner
"
Class {
	#name : #MBCheckpointDevCommand,
	#superclass : #MBDevCycleCommands,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:10'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCheckpointDevCommand>>documentation [
	^ 'Save modified packages in their respective repository, update the configuration and save a version of the configuration in it''s repository.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCheckpointDevCommand>>execute [
	| message configClass |
	configClass := self configurationClass.
	message := self uiManager
		multilineRequest:
			'Enter commit message for ' , (configClass name configurationBaseName) , ' '
				, (target project version: #development) versionString
		initialAnswer: (target project version: #development) versionString, ' ():'.
	message == nil
		ifTrue: [ ^ self ].
	self executeWithMessage: message

]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCheckpointDevCommand>>executeWithMessage: message [
	| configClass |
	configClass := self configurationClass.
	self checkUserInRepositoryOfPackage: configClass name asString.
	MetacelloToolBox saveModifiedPackagesAndConfigurationIn: configClass description: message.

]

{
	#category : #ordering,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCheckpointDevCommand>>order [

	^'50'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBCheckpointDevCommand>>title [
	^ 'checkpoint dev'
]
