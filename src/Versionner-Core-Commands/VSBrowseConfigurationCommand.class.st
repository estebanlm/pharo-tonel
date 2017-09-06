"
Browse the configuration class.
"
Class {
	#name : #VSBrowseConfigurationCommand,
	#superclass : #VSConfigurationCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSBrowseConfigurationCommand>>execute [
	self configurationClass browse
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSBrowseConfigurationCommand>>title [
	^ 'browse configuration'
]
