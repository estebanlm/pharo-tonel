"
I build FFI method bytecodes for a call. 

"
Class {
	#name : #FFICalloutMethodBuilder,
	#superclass : #Object,
	#instVars : [
		'calloutAPI',
		'requestor',
		'sender',
		'signature',
		'module',
		'functionResolutionStrategies'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder class>>calloutAPI: aCalloutAPI  [
	^ self basicNew 
		initializeCalloutAPI: aCalloutAPI;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>addFunctionResolveStrategy: aStrategy [
	functionResolutionStrategies add: aStrategy
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>build: aBlock  [
	aBlock value: self.
	^ self generate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>callType [
	self callingConvention = #cdecl ifTrue: [ ^ 0 ].
	self callingConvention = #stdcall ifTrue: [ ^ 1 ].

	self error: 'Invalid call convention!'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>callingConvention [
	^ self calloutAPI callingConvention
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>calloutAPI [
	^ calloutAPI
]

{
	#category : #'private factory',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>createFFICallout [
	^ FFICallout new
		sender: self sender;
		options: self calloutAPI options;
		yourself
]

{
	#category : #'private factory',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>createFFICalloutLiteralFromSpec: functionSpec [
	| externalFunction |
	
	externalFunction := ExternalLibraryFunction
		name: functionSpec functionName
		module: self moduleName
		callType: self callType
		returnType: functionSpec returnType externalTypeWithArity
		argumentTypes: (functionSpec arguments collect: #externalTypeWithArity).
	
	functionResolutionStrategies
		detect: [ :each | each isApplicableFor: self requestor ]
		ifFound: [ :each | each resolve: externalFunction ].
		
	^ externalFunction
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>generate [
	^ self generateMethodFromSpec: (self parseSignature: self signature)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>generateFFICallout: builder spec: functionSpec [
	"Builds a method call"
	builder
		numArgs: self method argumentNames size;
		addTemps: (self method argumentNames copyWith: #result).
	"save ffi call as literal"
	builder pushLiteral: (self createFFICalloutLiteralFromSpec: functionSpec).
	"iterate arguments in order (in the function) to create the function call"
	functionSpec arguments
		do: [ :each | each emitArgument: builder context: sender ].
	"create the array"
	builder pushConsArray: functionSpec arguments size.
	"send call and store into result"
	builder send: #invokeWithArguments:.
	functionSpec arguments
		do: [ :each | each emitReturnArgument: builder context: sender ].
	"convert in case return type needs it. And return reseult"
	^ functionSpec returnType
		emitReturn: builder
		resultTempVar: #result
		context: sender
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>generateMethodFromSpec: functionSpec [
	| ir |
	ir := IRBuilder buildIR: [ :builder | 
		self generateFFICallout: builder spec: functionSpec ].
	^ ir generate: self method trailer
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>initialize [
	super initialize.
	functionResolutionStrategies := FFIFunctionResolutionStrategy allSubclasses collect: #new
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>initializeCalloutAPI: aCalloutAPI [
	calloutAPI := aCalloutAPI.
	self initialize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>method [
	^ self sender method
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>module  [
	^ module
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>module: moduleNameOrLibraryClass  [
	"A module can be a string with a path to the library or a reference to a class who is child 
	 of FFILibrary.
	 Example: 'libc' or LibC"
	module := moduleNameOrLibraryClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>moduleName [
	"Answer the module name, who can come from a string with the path to the module or a 
	 reference to a class who is child of FFILibrary"
	self module ifNil: [ ^ nil ].
	^ self module asFFILibrary moduleName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>parseSignature: aSignature [
	^ FFIFunctionParser new  
		requestor: self requestor;
		parseNamedFunction: aSignature
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>requestor [
	^ requestor ifNil: [ requestor := self createFFICallout ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>requestor: anObject  [
	"The object who made the request for FFI.
	 By default, NBFFICallout (check #requestor)"
	requestor := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>sender [
	^ sender
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>sender: anObject [
	sender := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>signature [
	^ signature
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilder>>signature: anObject [
	signature := anObject
]
