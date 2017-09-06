"

"
Class {
	#name : #FFIOpaqueObjectTests,
	#superclass : #TestCase,
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOpaqueObjectTests>>ffiBindingOf: aName [
	^ self class ffiBindingOf: aName
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOpaqueObjectTests>>ffiInstVarArgument: argName generator: generator [
	^ argName
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOpaqueObjectTests>>newParser  [
	^ FFIFunctionParser new
		requestor: (FFICallout new
			requestor: self;
			yourself);
		yourself
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOpaqueObjectTests>>testDereferencedExternalObjectError [
	self 
		should: [ self newParser parseNamedFunction: #( void function ( FFIOpaqueObject arg ) ) ]
		raise: FFIDereferencedOpaqueObjectError.
	self 
		should: [ self newParser parseNamedFunction: #( FFIOpaqueObject function ( ) ) ]
		raise: FFIDereferencedOpaqueObjectError
		

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOpaqueObjectTests>>testParseAsBigArityPointer [
	 | fnSpec arg returnType |
	
	fnSpec := self newParser parseNamedFunction: #( void function ( FFIOpaqueObject **arg ) ). 
	arg := fnSpec arguments first.
	self assert: arg class equals: FFIOpaqueObjectType.
	self assert: arg pointerArity equals: 2.
	
	fnSpec := self newParser parseNamedFunction: #( FFIOpaqueObject **function ( ) ). 
	returnType := fnSpec returnType.
	self assert: returnType class equals: FFIOpaqueObjectType.
	self assert: returnType pointerArity equals: 2.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIOpaqueObjectTests>>testParseAsPointer [
	 | fnSpec arg returnType |
	
	fnSpec := self newParser parseNamedFunction: #( void function ( FFIOpaqueObject *arg ) ). 
	arg := fnSpec arguments first.
	self assert: arg class equals: FFIOpaqueObjectType.
	self assert: arg pointerArity equals: 1.
	
	fnSpec := self newParser parseNamedFunction: #( FFIOpaqueObject *function ( ) ). 
	returnType := fnSpec returnType.
	self assert: returnType class equals: FFIOpaqueObjectType.
	self assert: returnType pointerArity equals: 1.
]
