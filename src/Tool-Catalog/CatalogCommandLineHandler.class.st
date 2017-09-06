"
Command line handler for dealing with projects from the command line

Usage: get [--help] ProjectName [--version=<version>]
	--help                        Show this help message
	ProjectName         The name of the project in catalog
	<version>                A valid version for the given configuration (default is #stable)
	
Examples:
	# installs Seaside3 
	pharo Pharo.image get Seaside3
	
	# installs Seaside3 version 3.1.2
	pharo Pharo.image get Seaside3 --version=3.1.2
"
Class {
	#name : #CatalogCommandLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'version',
		'projectName'
	],
	#category : #Tool-Catalog-CommandLine,
	#timestamp : 'EstebanLorenzano 7/15/2015 15:41'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler class>>commandName [
	^ 'get'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler class>>description [
	^ 'Install catalog projects from the command line (consult catalog at http://catalog.pharo.org)'
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler>>activate [
	self activateHelpWithoutArguments
		ifTrue: [ ^ self ].
	self getProject
]

{
	#category : #activation,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler>>getProject [
	| project |
	project := CatalogProvider projectNamed: self projectName.

	self inform: 'Installing ', project name.
	project isAvailableForCurrentPharo ifFalse: [ 
		self warning: ('{1} is not tagged as available for current Pharo version. Trying to install anyway, but it can fail!' format: { self projectName }) ].
	project installVersion: self version.
	
	Smalltalk snapshot: true andQuit: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler>>projectName [
	^ projectName ifNil: [ projectName := self argumentAt: 1 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler>>version [
	^ version ifNil: [ 
		version := (self hasOption: 'version')
			ifTrue: [ self optionAt: 'version' ]
			ifFalse: [ #stable ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
CatalogCommandLineHandler>>warning: aString  [
	self inform: aString
]
