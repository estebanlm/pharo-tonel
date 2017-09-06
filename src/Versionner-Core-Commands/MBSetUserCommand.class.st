"
Command to bset the user in Versionner
"
Class {
	#name : #MBSetUserCommand,
	#superclass : #MBConfigurationInfoCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:08'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSetUserCommand>>documentation [
	^ 'Set the user and password used when saving and loading packages and configurations.'
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSetUserCommand>>execute [
	target configurationRoot username: nil.
	target configurationRoot password: nil.
	self username.
	self password.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSetUserCommand>>title [
	^ 'set user and password'
]
