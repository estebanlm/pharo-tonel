"
I'm a façade to perform ffi nb calls.
"
Class {
	#name : #FFICalloutAPI,
	#superclass : #Object,
	#instVars : [
		'context',
		'options',
		'callingConvention'
	],
	#classVars : [
		'CalloutAPIClass'
	],
	#category : #UnifiedFFI,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI class>>calloutAPIClass [
	^ CalloutAPIClass ifNil: [ CalloutAPIClass := self defaultCalloutAPIClass ]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI class>>calloutAPIClass: aClass [
	CalloutAPIClass := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI class>>defaultCalloutAPIClass [
	^ FFICalloutAPI	
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI class>>inContext: aContext [
	^ self basicNew 
		initializeContext: aContext;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI class>>new  [
	self error: 'Use #inContext'
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>callingConvention [
	^ callingConvention
]

{
	#category : #'call conventions',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>cdecl [
	callingConvention := #cdecl
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>context [
	^ context
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>convention: aCallingConvention [
	"It can be #cdecl or #stdcall"
	callingConvention := aCallingConvention
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>function: functionSignature module: moduleNameOrLibrary [
	| sender ffiMethod |
	
	sender := context ifNil: [thisContext sender sender].

	"Build new method"
	ffiMethod := self newBuilder build: [ :builder | 
		builder
			signature: functionSignature;  
			sender: sender;
			module: moduleNameOrLibrary ].
	ffiMethod 
		selector: sender selector;
		methodClass: sender methodClass.		
	"Replace with generated ffi method, but save old one for future use"
	ffiMethod 
		propertyValueAt: #ffiNonCompiledMethod 
		put: (sender methodClass methodDict at: sender selector).
	sender methodClass methodDict 
		at: sender selector
		put: ffiMethod.
	"Register current method as compiled for ffi"
	FFIMethodRegistry uniqueInstance registerMethod: ffiMethod.
	"Resend"
	sender return: (sender receiver 
		withArgs: sender arguments 
		executeMethod: ffiMethod)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>initialize [
	callingConvention := #cdecl.
	options := #().
	super initialize
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>initializeContext: aContext [
	context := aContext.
	self initialize
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>newBuilder [
	^ FFICalloutMethodBuilder calloutAPI: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>options [
	^ options
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>options: anObject [
	options := anObject
]

{
	#category : #'call conventions',
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutAPI>>stdcall [
	callingConvention := #stdcall
]
