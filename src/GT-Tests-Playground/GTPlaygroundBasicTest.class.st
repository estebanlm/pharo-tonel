"

"
Class {
	#name : #GTPlaygroundBasicTest,
	#superclass : #TestCase,
	#instVars : [
		'playground',
		'window'
	],
	#category : #GT-Tests-Playground,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTPlaygroundBasicTest>>setUp [

	playground := GTPlayground new.
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTPlaygroundBasicTest>>tearDown [

	window ifNotNil: [ window delete ].
	window := nil.
	playground := nil
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTPlaygroundBasicTest>>testAccessBindings [
	|obtainedBindings expectedBindings|

	expectedBindings := Dictionary new.  
	expectedBindings add: (WorkspaceVariable key: #a value: 1).
	expectedBindings add: (WorkspaceVariable key: #b value: 2).
		
	window := playground openOn: (GTPlayPage new saveContent: 'a:=1. b:=a+1').
	playground inspectorPresentation firstPresentation selectLine.
	playground inspectorPresentation firstPresentation evaluateSelection.
		
	obtainedBindings := playground currentBindings.
		
	self assert: obtainedBindings equals: expectedBindings.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTPlaygroundBasicTest>>testResetBindings [
	|obtainedBindings|

	window := playground openOn: (GTPlayPage new saveContent: 'number+1').
	playground 
		setBindings: { #number -> 2 } asDictionary.
		
	obtainedBindings := playground currentBindings.
	self assert: obtainedBindings size equals: 1.

	playground resetBindings.		
	
	obtainedBindings := playground currentBindings.
	self assert: obtainedBindings size equals: 0.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTPlaygroundBasicTest>>testSettingBindings [
	|obtainedResult|
	obtainedResult:=nil.
	window := playground openOn: (GTPlayPage new saveContent: 'number+1').
	playground 
		setBindings: { #number -> 2 } asDictionary.
	playground inspectorPresentation firstPresentation selectLine.
	
	playground inspectorPresentation firstPresentation announce: (GLMEvaluateSelection new 
		action: [ :aResult | obtainedResult := aResult ];
		makeSyncronous).
		
	self assert: obtainedResult equals: 3
	
]
