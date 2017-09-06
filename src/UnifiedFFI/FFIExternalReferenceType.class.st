"
I'm a abstract type for ""referenced"" types. 
See ==FFIExternalReference== for details.
"
Class {
	#name : #FFIExternalReferenceType,
	#superclass : #FFIExternalType,
	#instVars : [
		'objectClass'
	],
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType class>>externalType [
	^ ExternalType void asPointerType
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType class>>naturalPointerArity [
	^ 1
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType class>>objectClass: aClass [
	^ self new objectClass: aClass
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>basicEmitArgument: aBuilder context: aContext [
 	self loader
		emitArgument: aBuilder 
		context: aContext 
		objectClass: self objectClass	
		instVarName: self instanceVariableName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>basicHandle: aHandle at: index [
	^ self objectClass fromHandle: (aHandle pointerAt: index)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>basicHandle: aHandle at: index put: value [
	value getHandle isExternalAddress 
		ifFalse: [ self error: 'value needs to be an ExternalAddress' ].
	^ aHandle pointerAt: index put: value getHandle

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>emitReturn: aBuilder resultTempVar: resultVar context: aContext [
	^ aBuilder 
		addTemp: #tmpResult;
		"keep invoke result into the tmpResult var"
		storeTemp: resultVar;
		popTop;
		"return := self objectClass basicNew"
		pushLiteralVariable: self objectClass binding;
		send: #basicNew;
		storeTemp: #tmpResult;
		popTop;
		"return instVarAt: (index of argName) put: result"
		pushTemp: #tmpResult;
		pushLiteral: (self objectClass 
			instVarIndexFor: self instanceVariableName 
			ifAbsent: [ self error: 'No handle instVar' ]);
		pushTemp: resultVar;
		send: #instVarAt:put:;
		popTop;
		pushTemp: #tmpResult;
		returnTop	
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>emitReturnArgument: builder context: aContext [
	self loader 
		emitPointerArityUnpack: builder
		type: self
		context: aContext
		objectClass: self objectClass
		instVarName: self instanceVariableName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>externalTypeAlignment [
	"this is always a pointer"
	^ self pointerAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>externalTypeSize [
	"this is always a pointer"
	^ self pointerSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>instanceVariableName [
	^ self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>needsArityUnpacking [
	"Referenced types by default can be ''unpacked'' if it needs also to be rolled"
	^ self needsArityPacking
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>objectClass [
	^ objectClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>objectClass: aClass [
	objectClass := aClass
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>prepareAsSelfFromCalloutDeclaration [

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>printOn: aStream [
	aStream << self className << '(' << objectClass name << ')'
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalReferenceType>>stackValueParameterClass [
	^ #integer
]
