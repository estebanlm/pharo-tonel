"
Abstract superclass for version info tests for Versionner
"
Class {
	#name : #MBAbstractVersionInfoTest,
	#superclass : #MBInfoTest,
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:20'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBAbstractVersionInfoTest class>>isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"
	
	^ self name = #MBAbstractVersionInfoTest
]
