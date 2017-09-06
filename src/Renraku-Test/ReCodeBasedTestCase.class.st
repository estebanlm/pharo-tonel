"
I provide a testing class and method which are destroyed later
"
Class {
	#name : #ReCodeBasedTestCase,
	#superclass : #RenrakuBaseTestCase,
	#instVars : [
		'testClass',
		'testMethod',
		'testClass2'
	],
	#category : #Renraku-Test,
	#timestamp : 'YuriyTymchuk 6/14/2016 13:48'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCodeBasedTestCase>>setUp [
	super setUp.
	testClass := Object
		subclass: 'NuclearSiteTestingClass'
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: testPackage name.
	testMethod := testClass >> (testClass compile: 'nuclearSiteTestingMethod ^ self').
	
	testClass2 := Object
		subclass: 'NuclearSiteTestingClass2'
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: testPackage name.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReCodeBasedTestCase>>tearDown [

	testPackage methods do: #removeFromSystem.
	testPackage definedClasses do: #removeFromSystem.
	super tearDown
]
