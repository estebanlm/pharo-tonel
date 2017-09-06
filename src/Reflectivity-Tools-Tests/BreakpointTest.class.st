"
A BreakpointTest is a test class for testing the behavior of Breakpoint
"
Class {
	#name : #BreakpointTest,
	#superclass : #TestCase,
	#instVars : [
		'previousBreakpoints',
		'cls'
	],
	#category : #Reflectivity-Tools-Tests,
	#timestamp : '<historical>'
}

{
	#category : #utils,
	#timestamp : ' 8/31/2017 05:26:45'
}
BreakpointTest>>newDummyClass [
	^ Object
		subclass: #DummyClassForBreakpoint
		instanceVariableNames: ''
		classVariableNames: ''
		package: 'DummyPackage'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
BreakpointTest>>setUp [
	super setUp.
	cls := self newDummyClass.
	previousBreakpoints := Breakpoint all copy.
	Breakpoint all removeAll.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:45'
}
BreakpointTest>>tearDown [
	| pkg |
	super tearDown.
	Breakpoint all addAll: previousBreakpoints.
	cls ifNotNil: [ cls isObsolete ifFalse: [ cls removeFromSystem ] ].
	pkg := 'DummyPackage' asPackageIfAbsent: [ ]. 
	pkg ifNotNil: [ pkg removeFromSystem ]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
BreakpointTest>>testRemoveClassWithBreakpoint [
	cls compile: 'dummy ^42'.
	self assert: Breakpoint all isEmpty.
	Breakpoint new
		node: (cls >> #dummy) ast;
		once;
		install.
	self assert: (cls >> #dummy) hasBreakpoint.
	cls removeFromSystem.
	self assert: Breakpoint all isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:45'
}
BreakpointTest>>testRemoveMethodWithBreakpoint [
	cls compile: 'dummy ^42'.
	self assert: Breakpoint all isEmpty.
	Breakpoint new
		node: (cls >> #dummy) ast;
		once;
		install.
	self assert: (cls >> #dummy) hasBreakpoint.
	cls removeSelector: #dummy.
	self
		assert: cls methods isEmpty;
		assert: Breakpoint all isEmpty
]
