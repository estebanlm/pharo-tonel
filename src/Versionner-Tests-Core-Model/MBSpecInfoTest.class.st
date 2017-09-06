"
SUnit tests for MBSpecInfo in Versionner
"
Class {
	#name : #MBSpecInfoTest,
	#superclass : #MBAbstractTest,
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:17'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfoTest class>>isAbstract [
	"Override to true if a TestCase subclass is Abstract and should not have
	TestCase instances built from it"
	
	^ self name = #MBSpecInfoTest
]
