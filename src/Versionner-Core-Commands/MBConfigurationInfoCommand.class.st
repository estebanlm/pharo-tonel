"
Common superclass for commands on configuration infos in Versionner
"
Class {
	#name : #MBConfigurationInfoCommand,
	#superclass : #MBCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'TorstenBergmann 2/20/2014 14:07'
}

{
	#category : #ui,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfoCommand>>showExecuteWhile: aBlock [

	^Cursor execute showWhile:  aBlock
]
