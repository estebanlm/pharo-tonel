"
I implement the push strategy for method arguments who are simple variables.
"
Class {
	#name : #FFIMethodArgument,
	#superclass : #FFIFunctionArgument,
	#instVars : [
		'index',
		'argName'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>argName [
	^ argName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>argName: anObject [
	argName := anObject
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>emitArgument: aBuilder context: aContext [
	aBuilder pushTemp: self argName asSymbol
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>emitArgument: aBuilder context: aContext objectClass: objectClass instVarName: aName [
	"If argument is an object, I need to send value of instVar aName instead it self"
	aBuilder 
		pushTemp: self argName asSymbol;
		pushLiteral: (objectClass 
			instVarIndexFor: aName 
			ifAbsent: [ self error: 'No ', aName, ' instVar' ]);
		send: #instVarAt:
]

{
	#category : #'private emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>emitArgumentVariableAccesingPart: aBuilder context: aContext objectClass: objectClass instVarName: aName [
	aBuilder 
		pushTemp: self argName asSymbol;
		pushLiteral: (objectClass 
			instVarIndexFor: aName 
			ifAbsent: [ self error: 'No ', aName, ' instVar' ]).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>index [
	"I am the index in the method. 
	 For example, method: arg1 withArg: arg2 will have arguments at index 1 and at index 2"
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>index: anObject [
	index := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIMethodArgument>>rolledPointerTempName [
	^ self rolledPointerTempNameFor: self argName
]
