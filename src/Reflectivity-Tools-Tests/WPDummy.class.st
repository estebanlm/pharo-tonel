"
I am a dummy class to test watchpoints
"
Class {
	#name : #WPDummy,
	#superclass : #Object,
	#instVars : [
		'foo'
	],
	#category : #Reflectivity-Tools-Tests,
	#timestamp : 'mcamp 11/19/2015 16:29'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>exampleAssignment [
	foo := 1.
	
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>exampleAssignment: anObject [
	foo := anObject.
	
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>exampleMessageSend [
	self exampleOperation
	
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>exampleOperation  [
	^ 2+3
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>exampleOperationAndAssignment [
	|a|
	a := 1 + 1.
	foo := a + a.
	
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>exampleOperationAndAssignment: aNumber [
	|a|
	a := aNumber.
	foo := a + a.
	
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>foo [
	^ foo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
WPDummy>>foo: anObject [
	foo := anObject
]
