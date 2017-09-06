"

"
Class {
	#name : #FFIConstantHandleTests,
	#superclass : #TestCase,
	#classVars : [
		'TIME_T_PTR'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : ''
}

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConstantHandleTests>>getTime: t [
     ^self ffiCall: #(long time(FFIConstantHandle *t) ) module: LibC
]

{
	#category : #primitives,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConstantHandleTests>>getTimeReturnConstantHandle: t [
     ^self ffiCall: #(FFIConstantHandle time(TIME_T_PTR t) ) module: LibC
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConstantHandleTests>>testCall [
	| object time |
	
	object := FFIConstantHandle new.
	time := self getTime: object.
	self assert: time equals: object handle.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIConstantHandleTests>>testReturn [
	| object time |
	
	TIME_T_PTR := FFIExternalValueHolder ofType: 'long'.
	
	object := TIME_T_PTR new value: 0.
	time := self getTimeReturnConstantHandle: object.
	self assert: time handle equals: object value.
]
