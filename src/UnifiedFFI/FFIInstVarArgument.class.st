"
I implement the push strategy for method arguments who are  instance variables.
"
Class {
	#name : #FFIInstVarArgument,
	#superclass : #FFIFunctionArgument,
	#instVars : [
		'argName'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInstVarArgument>>argName [
	^ argName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInstVarArgument>>argName: anObject [
	argName := anObject
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInstVarArgument>>emitArgument: aBuilder context: aContext [
	aBuilder pushInstVar: (aContext methodClass instVarIndexFor: self argName).
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInstVarArgument>>emitArgument: aBuilder context: aContext objectClass: objectClass instVarName: aName [
	"If argument is an object, I need to send value of instVar aName instead it self"
	aBuilder 
		pushInstVar: (aContext methodClass instVarIndexFor: self argName);
		pushLiteral: (objectClass 
			instVarIndexFor: aName 
			ifAbsent: [ self error: 'No ', aName, ' instVar' ]);
		send: #instVarAt:
]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInstVarArgument>>emitArgumentVariableAccesingPart: aBuilder context: aContext objectClass: objectClass instVarName: aName [
	aBuilder 
		pushInstVar: (aContext methodClass instVarIndexFor: self argName);
		pushLiteral: (objectClass 
			instVarIndexFor: aName 
			ifAbsent: [ self error: 'No ', aName, ' instVar' ]).

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInstVarArgument>>rolledPointerTempName [
	^ self rolledPointerTempNameFor: self argName
]
