"
Unload the package with the selected configuration.
"
Class {
	#name : #VSUnloadConfigurationCommand,
	#superclass : #VSConfigurationCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSUnloadConfigurationCommand>>execute [
	| answer |
	answer := UIManager default confirm: 'Are you sure you want to unload ' , target name.
	answer
		ifTrue: [ target workingCopy unload ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSUnloadConfigurationCommand>>title [
	^ 'unload'
]
