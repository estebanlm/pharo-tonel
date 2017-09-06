"
A command that apply to a project version.
"
Class {
	#name : #VSVersionCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSVersionCommand>>configurationClass [
	^ target configurationClass
]
