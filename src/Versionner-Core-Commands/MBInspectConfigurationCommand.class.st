"
Command to inspect a configuration in versionner
"
Class {
	#name : #MBInspectConfigurationCommand,
	#superclass : #MBConfigurationInfoCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:08'
}

{
	#category : #documentation,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInspectConfigurationCommand>>documentation [
	^ 'Open a Smalltalk inspector on the Configuration.'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInspectConfigurationCommand>>execute [
	target inspect
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBInspectConfigurationCommand>>title [
	^ 'inspect'
]
