"

"
Class {
	#name : #ReSmalllintCheckerTest,
	#superclass : #ReCodeBasedTestCase,
	#category : #Renraku-Test,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
ReSmalllintCheckerTest>>testRun [
	| checker |
	
	checker := ReSmalllintChecker new
		rule: { ScreamerRule new };
		environment: testPackage asEnvironment;
		yourself.
		
	checker run.
	
	self assert: (checker criticsOf: ScreamerRule new) notEmpty.
]
