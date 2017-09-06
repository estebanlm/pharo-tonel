Extension {
	#name : #Callback
}

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Callback>>callbackEvaluator: anEvaluator   [
	evaluator := #evaluatorValueWithContext:sp:.
	numEvaluatorArgs := 2.
	block := anEvaluator.
	thunk := FFICallbackThunk newCCall.
	self addToThunkTable
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Callback>>evaluator [
	^ block
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Callback>>evaluatorValueWithContext: aContext sp: anAlien [
	^ self evaluator 
		valueWithContext: aContext 
		sp: anAlien
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Callback class>>forAddress: address  [
	"Reconstructs a callback from an address (an integer). 
	 This is useful for reading callbacks from a structure. 
	 WARNING: Of course, the callback needs to exist before :)"
	| callback |
	
	callback := ThunkToCallbackMap 
		at: address 
		ifAbsent: [ self error: 'No callback for address 16r', address printStringHex, '.' ].	
	callback ifNil: [ 
		self error: 'Callback at address 16r', address printStringHex, ' has been collected.' ].
		
	^ callback
]

{
	#category : #'*UnifiedFFI',
	#timestamp : ' 8/31/2017 05:26:10'
}
Callback class>>forCallbackEvaluator: anEvaluator  [
	^ self newForPlatform callbackEvaluator: anEvaluator
]
