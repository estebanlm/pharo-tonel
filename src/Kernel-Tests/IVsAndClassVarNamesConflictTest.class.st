"
SUnit tests to tests conflicts for instance variables and class variable names
"
Class {
	#name : #IVsAndClassVarNamesConflictTest,
	#superclass : #TestCase,
	#instVars : [
		'classFactory'
	],
	#category : #Kernel-Tests-Classes,
	#timestamp : 'TorstenBergmann 2/5/2014 08:36'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
IVsAndClassVarNamesConflictTest>>setUp [
	super setUp.
	classFactory := ClassFactoryForTestCase new
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
IVsAndClassVarNamesConflictTest>>tearDown [
	super tearDown.
	classFactory cleanUp
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
IVsAndClassVarNamesConflictTest>>testOneCanProceedWhenIntroducingCapitalizedInstanceVariables [
	| class |
	[ 
		class := classFactory
			newSubclassOf: classFactory defaultSuperclass
			instanceVariableNames: 'X Y'
			classVariableNames: ''
	]
		on: Exception
		do: [ :ex | ex resume ].
	self assert: (Smalltalk keys includes: class name)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
IVsAndClassVarNamesConflictTest>>testOneCanProceedWhenIntroducingClasseVariablesBeginingWithLowerCaseCharacters [
	| class |
	[ 
		class := classFactory
			newSubclassOf: classFactory defaultSuperclass
			instanceVariableNames: 'a BVarName'
			classVariableNames: ''
	]
		on: Exception
		do: [ :ex | ex resume ].
	self assert: (Smalltalk keys includes: class name)
]
