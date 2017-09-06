"
Versionnner commands related to the development workflow.
"
Class {
	#name : #VSDevCycleCommand,
	#superclass : #VSCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSDevCycleCommand>>createDevelopmentVersion [
	| newDevVersionString |
	
	newDevVersionString := UIManager default
		request: 'No development version found! (must be a baseline)' , Character cr asString ,
					'Version number for the next development version'
		initialAnswer: 1.0
		title: 'Create a development version'.
	newDevVersionString ifNotNil: [ 
		newDevVersionString := workflow standardizeDevVersionString: newDevVersionString.
		workflow createNextDevelopment: newDevVersionString ]
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSDevCycleCommand>>ensureDevelopmentVersionExists [
	[ workflow developmentVersion ]
		on: MetacelloVersionDoesNotExistError
		do: [ self createDevelopmentVersion ]
]

{
	#category : #checking,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSDevCycleCommand>>ensureDevelopmentVersionIsBaseline [
	| devVersion |
	devVersion := workflow developmentVersion.
	(devVersion blessing == #baseline) 
		ifFalse: [ self createDevelopmentVersion ]
]
