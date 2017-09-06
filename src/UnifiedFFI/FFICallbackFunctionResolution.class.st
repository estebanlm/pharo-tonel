"
I install callbacks as functions (to be used with ffiCall: later)

I can register any callback with a name, the callback thunk will be used as an entry point for this function.

I implement the option:  optCallbackCall 
	
Example: 
========
callAbsoluteMethod
	 |  callback |

	callback := FFICallback 
		signature: #(double (double x)) 
		block: [ :x | x abs ].
	FFICallbackFunctionResolution register:  callback as:  #absolute.
	self absolute: 42.0.

absolute: aNumber
	self ffiCall: #(double absolute (double aNumber)) options: #(+optCallbackCall)	

"
Class {
	#name : #FFICallbackFunctionResolution,
	#superclass : #FFIFunctionResolutionStrategy,
	#classVars : [
		'CallbackRegistry'
	],
	#category : #UnifiedFFI,
	#timestamp : 'EstebanLorenzano 4/22/2016 14:56'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution class>>callbackNamed: functionName ifAbsent: aBlock  [
	^ self callbackRegistry 
		at: functionName asSymbol
		ifAbsent: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution class>>callbackRegistry  [
	^ CallbackRegistry ifNil: [ CallbackRegistry := Dictionary new ]
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution class>>cleanUp [
	self reset
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution class>>registerCallback: aCallback as: functionName [
	self callbackRegistry 
		at: functionName asSymbol 
		put: aCallback.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution class>>reset [
	CallbackRegistry := nil
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution class>>unregister: functionName [
	self callbackRegistry removeKey: functionName asSymbol 
		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution>>isApplicableFor: aRequestor [
	^ aRequestor optionAt: #optCallbackCall
]

{
	#category : #resolving,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICallbackFunctionResolution>>resolveFunction: anExternalFunction [
	| callback |
	callback := self class 
		callbackNamed: anExternalFunction name
		ifAbsent: [ self error: 'Callback #', anExternalFunction name, ' not registered!' ].
	^ ExternalAddress fromAddress: callback thunk address
]
