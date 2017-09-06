"
Common superclass for test for Versionner
"
Class {
	#name : #MBAbstractTest,
	#superclass : #TestCase,
	#instVars : [
		'configuration'
	],
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:13'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractTest class>>isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"
	
	^ self name = #MBAbstractTest
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractTest>>configurationName [

	^'ConfigurationOfDummyConfiguration'
]

{
	#category : #util,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractTest>>removeClassIfExist: aSymbol [
	Smalltalk globals at: aSymbol ifPresent: [ :cls | cls removeFromSystem ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractTest>>setUp [

	(Smalltalk globals includesKey: self configurationName asSymbol) 
		ifFalse: [ 
			MetacelloToolBox configurationNamed: self configurationName.
				(Smalltalk globals at: self configurationName asSymbol) compile: 'baseline10: spec 
        <version: ''1.0-baseline''>
        
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: ''http://www.squeaksource.com/Versionner''.
		    spec package: ''Collections-Streams''.
                ].'.

			(Smalltalk globals at: self configurationName asSymbol) compile: 'default: spec 
        <version: ''default''>
        
        spec for: #common do: [
                spec blessing: #baseline.
                spec repository: ''http://www.squeaksource.com/Versionner''.
		    spec package: ''Collections-Streams''.
                ].'.
			].
		
	configuration := (Smalltalk globals at: self configurationName asSymbol) 

]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractTest>>tearDown [
	super tearDown.
	configuration := nil.
	self removeClassIfExist: self configurationName asSymbol

]
