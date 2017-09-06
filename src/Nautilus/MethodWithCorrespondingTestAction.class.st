"
Action when the method has a corresponding test method
"
Class {
	#name : #MethodWithCorrespondingTestAction,
	#superclass : #AbstractMethodIconAction,
	#instVars : [
		'testMethod'
	],
	#category : #Nautilus-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodWithCorrespondingTestAction>>actionOrder [
	"Return the priority of this action"
	
	^ 500
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodWithCorrespondingTestAction>>isActionHandled [

	^ (testMethod := method correspondingTestMethod) notNil 
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodWithCorrespondingTestAction>>privateActionIcon [
	"Return the icon for this action"
	
	^ IconicButton new
		target: self browser;
		actionSelector: #runTestForAMethod:notifying:;
		arguments:  { method. true};
		labelGraphic: (self iconForTestResultOf: testMethod) ;
		color: Color transparent;
		extent: 12 @ 12;
		helpText: 'Run the test';
		borderWidth: 0
]
