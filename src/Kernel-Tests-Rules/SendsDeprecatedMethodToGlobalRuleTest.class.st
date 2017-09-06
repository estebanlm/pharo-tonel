"

"
Class {
	#name : #SendsDeprecatedMethodToGlobalRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'testClass',
		'globalName'
	],
	#category : #Kernel-Tests-Rules,
	#timestamp : ''
}

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>deprecatedMethodName [

	^ 'deprecatedMethod'
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>globalName [

	^ globalName ifNil: [ 
		[ globalName :=
			('TestGlobal', 1e10 atRandom asString) asSymbol
		] doWhileTrue: [ 
			Smalltalk globals includesKey: globalName ] ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>nonDeprecatedMethodName [

	^ 'not', self deprecatedMethodName 
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>setUp [
	| deprClass |
	
	deprClass := Object newAnonymousSubclass. 
	Smalltalk globals at: self globalName put: deprClass new.
	
	deprClass compile: self deprecatedMethodName, ' self deprecated: ''this method is deprecated'''.
	deprClass compile: self nonDeprecatedMethodName.
	
	testClass := Object newAnonymousSubclass.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>tearDown [

	Smalltalk globals removeKey: self globalName ifAbsent: [ ].
	globalName := nil.
	
	testClass := nil.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>testBasicCheck [

	| testMethod |
	testMethod := testClass >> (
		testClass compile: 'testMethod ', self globalName, ' ', self deprecatedMethodName).

	self assert: (testMethod externalProperties anySatisfy: [ :eprop |
		eprop rule class = SendsDeprecatedMethodToGlobalRule ])
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>testBasicCheck1 [

	| testMethod |
	testMethod := testClass >> (
		testClass compile: 'testMethod ', self globalName, ' ', self nonDeprecatedMethodName).

	self assert: (testMethod externalProperties noneSatisfy: [ :eprop |
		eprop rule class = SendsDeprecatedMethodToGlobalRule ])
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>testBasicCheck2 [

	| testMethod |
	testMethod := testClass >> (
		testClass compile: 'testMethod ').

	self assert: (testMethod externalProperties noneSatisfy: [ :eprop |
		eprop rule class = SendsDeprecatedMethodToGlobalRule ])
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
SendsDeprecatedMethodToGlobalRuleTest>>testBasicCheck3 [

	| testMethod |
	
	testClass addClassVarNamed: #TestVar.
	
	testMethod := testClass >> (
		testClass compile: 'testMethod TestVar yourself').

	self assert: (testMethod externalProperties noneSatisfy: [ :eprop |
		eprop rule class = SendsDeprecatedMethodToGlobalRule ])
]
