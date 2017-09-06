"
A command that apply to a project configuration.
"
Class {
	#name : #VSConfigurationCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSConfigurationCommand>>configurationClass [
	^ target configurationClass
]
