"
I'm a context for make tests run. 
I'm polymorphic with Context and in some way also with CompiledMethod (but just in the context of the execution of the tests for method builder).
"
Class {
	#name : #FFICalloutMethodBuilderTestContext,
	#superclass : #Object,
	#instVars : [
		'selector',
		'argumentNames',
		'methodClass'
	],
	#category : #UnifiedFFI-Tests,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>argumentNames [
	^ argumentNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>argumentNames: anObject [
	argumentNames := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>method [
	^ self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>methodClass [
	^ methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>methodClass: anObject [
	methodClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>selector [
	^ selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>selector: anObject [
	selector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFICalloutMethodBuilderTestContext>>trailer [
	^ CompiledMethodTrailer empty
]
