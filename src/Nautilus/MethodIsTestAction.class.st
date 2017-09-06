"
Aciton when the method is a test
"
Class {
	#name : #MethodIsTestAction,
	#superclass : #AbstractMethodIconAction,
	#category : #Nautilus-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsTestAction>>actionOrder [
	"Return the priority of this action"
	
	^ 0
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsTestAction>>isActionHandled [

	^ method isTestMethod and: [ method methodClass isAbstract not ]
]

{
	#category : #order,
	#timestamp : ' 8/31/2017 05:26:22'
}
MethodIsTestAction>>privateActionIcon [
	"Return the icon for this action"
	
	^ IconicButton new
		target: self browser;
		actionSelector: #runTestForAMethod:notifying:;
		arguments: {method. true};
		labelGraphic: (self iconForTestResultOf: method);
		color: Color transparent;
		helpText: 'Run the test';
		extent: self iconExtent;
		borderWidth: 0
]
