"
SUnit tests for MBConfigurationInfo in Versionner
"
Class {
	#name : #MBConfigurationInfoTest,
	#superclass : #MBInfoTest,
	#instVars : [
		'info',
		'browser'
	],
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:19'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfoTest>>setUp [
	super setUp.

	info := MBConfigurationInfo configurationClass: configuration.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfoTest>>testBaselines [

	"+1 is for the default: baseline"
	self assert: info baselines size = ((configuration selectors select: [ :s | s beginsWith: 'baseline']) size + 1).

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBConfigurationInfoTest>>testDefaultVersion [
	
	self assert: (configuration selectors select: [ :s | s beginsWith: 'baseline']) size + 1 
		equals:	info baselines size

]
