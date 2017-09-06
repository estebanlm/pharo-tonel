"
Command to validate all configurations in versionner
"
Class {
	#name : #MBValidateAllConfigurationCommand,
	#superclass : #MBConfigurationInfoCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:09'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBValidateAllConfigurationCommand>>documentation [
	^ 'Validate all configuration.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBValidateAllConfigurationCommand>>execute [
	self showExecuteWhile: [ target configurationRoot configurations doWithIndex: [ :info :index | info validateFull ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBValidateAllConfigurationCommand>>title [
	^ 'validate all configurations'
]
