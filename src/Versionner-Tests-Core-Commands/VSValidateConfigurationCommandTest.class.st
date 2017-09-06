"

"
Class {
	#name : #VSValidateConfigurationCommandTest,
	#superclass : #MBCommandTests,
	#category : #Versionner-Tests-Core-Commands,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSValidateConfigurationCommandTest>>testExecute [
	self
		should: [ (VSValidateConfigurationCommand target: (MBConfigurationInfo configurationClass: configuration) for: nil) execute ]
		raise: MetacelloStackCacheNotification
]
