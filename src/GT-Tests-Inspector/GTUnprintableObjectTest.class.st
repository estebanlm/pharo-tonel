"
GTUnprintableObjectTest is a test that checks that print string does not trigger an error in the inspector.
"
Class {
	#name : #GTUnprintableObjectTest,
	#superclass : #GLMMorphicTest,
	#category : #GT-Tests-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTUnprintableObjectTest>>printString [
	"Simulate an error in printString"
	1/0
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTUnprintableObjectTest>>testInspectDoesNotCrash [
	window := GTInspector openOn: self class new 
]
