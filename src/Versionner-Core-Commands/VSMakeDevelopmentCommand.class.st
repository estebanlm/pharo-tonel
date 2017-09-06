"
I'm a command to declare versions as development.
"
Class {
	#name : #VSMakeDevelopmentCommand,
	#superclass : #VSMakeVersionCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeDevelopmentCommand>>canBeApplied [
	^ target isDevelopment not and: [ target isBaseline ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeDevelopmentCommand>>symbolicVersion  [
	^ #development
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSMakeDevelopmentCommand>>title [
	^ 'make development version'
]
