"
Command to load a configuration in versionner
"
Class {
	#name : #MBSaveConfigurationCommand,
	#superclass : #MBConfigurationInfoCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:08'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSaveConfigurationCommand>>documentation [
	^ 'Save the configuration in its repository. Note that the dependents projects and defined packages are not saved. Use ''checkpoint dev'' command to save packages.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSaveConfigurationCommand>>execute [
	| message |
	message := self uiManager multilineRequest: 'Enter commit message' initialAnswer: ''.
	message == nil
		ifTrue: [ ^ self ].
	self executeWithMessage: message
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSaveConfigurationCommand>>executeWithMessage: message [
	"execute with message"
	self checkUserInRepositoryOfPackage: self configurationClass name asString.
	MetacelloToolBox 
		saveConfigurationPackageFor: self configurationClass name asString 
		description: message
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSaveConfigurationCommand>>title [
	^ 'save configuration'
]
