"

"
Class {
	#name : #VSUnloadUnit,
	#superclass : #Object,
	#instVars : [
		'configurationClass',
		'commitVersion'
	],
	#category : #Versionner-Commit,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSUnloadUnit class>>configurationClass: aClass [
	^ self basicNew 
		initializeConfigurationClass: aClass;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSUnloadUnit class>>new [
	self error: 'Use #configuration:'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSUnloadUnit>>configurationClass [
	^ configurationClass
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:39'
}
VSUnloadUnit>>execute  [
	| developmentVersion project |
	
	developmentVersion := self configurationClass project version: #development. 
	project := MTProject
		newFromVersion: developmentVersion
		inConfiguration: self configurationClass.
		
	(self configurationClass class selectors includes: #preUnload)
		ifTrue: [ self configurationClass perform: #preUnload ].
		
	project packages do: [ :eachPackage | 
		(MCWorkingCopy allManagers 
			detect: [ :each | each packageName = eachPackage name ])
			unload ].
	
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:39'
}
VSUnloadUnit>>initializeConfigurationClass: aClass [
	configurationClass := aClass.
	self initialize
]
