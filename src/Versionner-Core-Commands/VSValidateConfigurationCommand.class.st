"
This command allows you to check inconsistencies in a Configuration class.
"
Class {
	#name : #VSValidateConfigurationCommand,
	#superclass : #VSConfigurationCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSValidateConfigurationCommand>>execute [

	| result |
	result := self validate.
	result ifEmpty: [ UIManager default inform: 'The configuration is correctly defined'. ^ self ].

	UIManager default inform: 'Issues were found'.
	result := result collect: [ :each | each explanation ].
	result explore
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSValidateConfigurationCommand>>title [
	^ 'validate'
]

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSValidateConfigurationCommand>>validate [
	self showExecuteWhile: [ ^ target validateFull ]
]
