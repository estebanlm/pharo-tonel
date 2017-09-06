"
Update the current development version with infomation provided by the project.

"
Class {
	#name : #VSUpdateDevelopmentVersionCommand,
	#superclass : #VSDevCycleCommand,
	#category : #Versionner-Core-Commands,
	#timestamp : 'ChristopheDemarey 2/6/2014 13:29'
}

{
	#category : #execute,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSUpdateDevelopmentVersionCommand>>execute [

	self ensureDevelopmentVersionExists.
	self ensureDevelopmentVersionIsBaseline.
	
	workflow updateDevelopment

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
VSUpdateDevelopmentVersionCommand>>title [
	^ 'Update development version'
]
