"
I'm an abstract class to implement FFI external types (types who will later be mapped to something understandable for a C library)
"
Class {
	#name : #FFIExternalType,
	#superclass : #Object,
	#instVars : [
		'pointerArity',
		'loader'
	],
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>asExternalTypeOn: generator [
	^ self new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>externalType [
	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>externalTypeAlignment [
	"Answer a number of bytes, which takes a value of given type
	(not a pointer to it)"
	self subclassResponsibility 	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>externalTypeSize [
	"Answer a number of bytes, which takes a value of given type
	(not a pointer to it)"
	self subclassResponsibility 	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>naturalPointerArity [
	"Indicates 'natural' pointer artity of type (atomic types are zero while any kind of 
	 pointer/reference/etc. is one)"
	^ 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>pointerAlignment [
	^ OSPlatform current ffiPointerAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>pointerSize [
	"Answer a number of bytes, which takes a pointer value"
	^ Smalltalk vm wordSize
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>resolveType: aTypeName [
	^ FFICallout new resolveType: aTypeName
	
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType class>>sizeOf: aTypeName [
	^ (self resolveType: aTypeName) typeSize
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>basicEmitArgument: aBuilder context: aContext [
	self loader 
		emitArgument: aBuilder 
		context: aContext
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>basicHandle: aHandle at: index [
	self subclassResponsibility
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>basicHandle: aHandle at: index put: value [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>callbackReturnOn: callbackContext for: anObject [
	"By default, I answer an integral return (not a float)"
	^ callbackContext wordResult: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>callbackValueFor: anObject at: index [
	"This is the value for a callback. 
	 The callback parameters came from an external adress who can be treated as a ByteArray, so it 
	 works the same as an FFIExternalArray (at least for now)"
	^ self handle: anObject at: index
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>emitArgument: aBuilder context: aContext  [
	self basicEmitArgument: aBuilder context: aContext.
	self needsArityPacking 
		ifTrue: [ self  emitPointerArityRoll: aBuilder context: aContext ]
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>emitFlatStructureLayoutFieldInto: flatStructureLayout [
	flatStructureLayout addField: self stackParameterClass size: self typeSize alignment: self typeAlignment
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>emitPointerArityRoll: aBuilder context: aContext [
	self loader 
		emitPointerArityPack: aBuilder 
		context: aContext 
		arity: self pointerArity
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>emitReturn: aBuilder resultTempVar: resultVar context: aContext  [
	^ aBuilder returnTop	
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>emitReturnArgument: builder context: aContext [
	"Some times functions need some post-process (for example, to unpack pointers). 
	 This call MUST exit with result value in top of the stack (otherwise it will 
	interfere with emitReturn:resultTempVar:context:"
	self loader 
		emitPointerArityUnpack: builder 
		type: self
		context: aContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>externalType [
	^ self class externalType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>externalTypeAlignment [
	^ self class externalTypeAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>externalTypeSize [
	^ self class externalTypeSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>externalTypeWithArity [
	^ self pointerArity > 0 
		ifTrue: [ self externalType asPointerType ]
		ifFalse: [ self externalType ]
]

{
	#category : #'accessing array',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>handle: aHandle at: index  [
	self isPointer ifTrue: [ ^ aHandle pointerAt: index ].
	^ self basicHandle: aHandle at: index
]

{
	#category : #'accessing array',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>handle: aHandle at: index put: value [
	self isPointer ifTrue: [ ^ aHandle pointerAt: index put: value ].
	^ self basicHandle: aHandle at: index put: value
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>initialize [
	super initialize.
	pointerArity := 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>isExternalType [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>isPointer [
	^ self pointerArity > 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>isVoid [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>loader [
	^ loader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>loader: aLoader [
	loader := aLoader
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>needsArityPacking [
	"Regular types needs to be ''rolled'' if they are passed as pointers to its calling functions. 
	 For example, executing consecutivelly this (simplified) two functions: 
	 [[[
	 	time := self ffiCall: #(time_t time(time_t* t) ). ""this will answer a long.""
	 	self ffiCall: #(tm* localtime(time_t* time) ) ""this requires a pointer to time."" 
	 ]]]
	 This mechanism allows UnifiedFFI to perform the roll of this pointers for you (it performs 
	 the equivallent of ==&time== in C). 
	
	 For packing/unpacking logic, arity needs to be bigger than inherent type arity. 
	 Means that if I have a type that is naturally a pointer (for example an ExternalAddress, who 
	 is a 'void*'), it will have a natural arity of 1, then I pack if arity is bigger. 
	 Other cases could need to be rolled when pointer arity is diffrent."
	^ self pointerArity > self class naturalPointerArity
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>needsArityUnpacking [
	"Simple types do not need ''unpacking'' because they can not used as buffers (to receive values 
	 from C functions).
	 For instance, in case you have functions with the form:
	 [[[ 
		self ffiCall: #(void getPoint( double *x, double *y)) 
	 ]]]
	 you cannot use instances of Float (since they are immutable in Pharo)... in that case you will
	 need to use an FFIExternalValueHolder."
	^ false
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>offsetReadFieldAt: offsetVariableName [
	^ self externalTypeWithArity offsetReadFieldAt: offsetVariableName
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>offsetWriteFieldAt: offsetVariableName with: valueName [
	^ self externalTypeWithArity 
		offsetWriteFieldAt: offsetVariableName 
		with: valueName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>pointerAlignment [
	^ self class pointerAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>pointerArity [
	^ pointerArity
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>pointerArity: additionalArity [
	pointerArity := pointerArity + additionalArity.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>pointerSize [
	^ self class pointerSize
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>printOn: aStream [
	super printOn: aStream.
	pointerArity timesRepeat: [ aStream nextPut: $* ]
]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>readFieldAt: byteOffset [
	^ self externalTypeWithArity readFieldAt: byteOffset
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>stackParameterClass [
	^ self isPointer ifTrue: [ #integer ] ifFalse: [ self stackValueParameterClass ]
]

{
	#category : #'stack parameter classification',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>stackValueParameterClass [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>typeAlignment [
	"Answer a number of bytes, which receiver type takes in memory"
	self pointerArity > 0 ifTrue: [ ^ self pointerAlignment ].
	^ self externalTypeAlignment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>typeSize [
	"Answer a number of bytes, which receiver type takes in memory"
	self pointerArity > 0 ifTrue: [ ^ self pointerSize ].
	^ self externalTypeSize
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>validateAfterParse: typeAndArityTuple [
	"After parse an argument or return, some times I need to validate arity is correct. 
	 This usually is ok, but since UFFI has types who do not have sense if they are not referenced as 
	 pointer (check my overrides), I act as an ''after parse'' validation."

]

{
	#category : #'emitting code',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIExternalType>>writeFieldAt: byteOffset with: valueName [
	^ self externalTypeWithArity 
		writeFieldAt: byteOffset 
		with: valueName
]
