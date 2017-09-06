"
I get signalled when a variable in a block or method scope shadows a variable of the same name in an outer scope.  The default action is to allow it.
"
Class {
	#name : #OCShadowVariableWarning,
	#superclass : #OCSemanticWarning,
	#instVars : [
		'shadowedVar'
	],
	#category : #OpalCompiler-Core-Exception,
	#timestamp : 'ajh 3/24/2003 22:21'
}

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>defaultAction  [

	^ self resume: (self variable: self node shadows: self shadowedVar)
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>node: aVariableNode [

	super node: aVariableNode.
	messageText := 'Temp shadows: ', aVariableNode name.

]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>openMenuIn: aBlock [
	self error: 'should not be called'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>shadowedVar [

	^ shadowedVar
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>shadowedVar: aVar [

	shadowedVar := aVar
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>showWarningOnTranscript [

	true ifTrue: [ ^ self ]. "turned off by default"

	Transcript crShow: self warningMessage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>stringMessage [
	^ 'Name already defined'
]

{
	#category : #correcting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>variable: varNode shadows: semVar [
	compilationContext interactive
		ifTrue: [ 
			OCSemanticError new
				node: node;
				compilationContext: compilationContext;
				messageText: self stringMessage;
				signal ]
		ifFalse: [ self showWarningOnTranscript ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCShadowVariableWarning>>warningMessage [

	^ String streamContents: [ :stream |
		stream	 
			nextPutAll: self methodClass name;
			nextPutAll: '>>';
			nextPutAll: self node methodNode selector;
			nextPutAll: '(';
			nextPutAll: self node name;
			nextPutAll: ' is shadowed)'	
	]
]
