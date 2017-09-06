"
FloatArrays store 32bit IEEE floating point numbers.
"
Class {
	#name : #FloatArray,
	#superclass : #ArrayedCollection,
	#type : #words,
	#category : #Collections-Native,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>= aFloatArray  [
	| length |
	<primitive: 'primitiveEqual' module: 'FloatArrayPlugin'>
	aFloatArray class = self class ifFalse: [^ false].
	length := self size.
	length = aFloatArray size ifFalse: [^ false].
	1 to: self size do: [:i | (self at: i)
			= (aFloatArray at: i) ifFalse: [^ false]].
	^ true
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>asFloatArray [
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>at: index [
	<primitive: 'primitiveAt' module: 'FloatArrayPlugin'>
	^Float fromIEEE32Bit: (self basicAt: index)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>at: index put: value [
	<primitive: 'primitiveAtPut' module: 'FloatArrayPlugin'>
	value isFloat 
		ifTrue:[self basicAt: index put: value asIEEE32BitWord]
		ifFalse:[self at: index put: value asFloat].
	^value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>defaultElement [
	"Return the default element of the receiver"
	^0.0
]

{
	#category : #arithmetic,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>dot: aFloatVector [
	"Primitive. Return the dot product of the receiver and the argument.
	Fail if the argument is not of the same size as the receiver."
       | result |
	<primitive: 'primitiveDotProduct' module: 'FloatArrayPlugin'>
	self size = aFloatVector size ifFalse:[^self error:'Must be equal size'].
	result := 0.0.
	1 to: self size do:[:i|
		result := result + ((self at: i) * (aFloatVector at: i))].
	^result
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>hash [
	| result |
	<primitive:'primitiveHashArray' module: 'FloatArrayPlugin'>
	result := 0.
	1 to: self size do:[:i| result := result + (self basicAt: i) ].
	^result bitAnd: 16r1FFFFFFF
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primAddArray: floatArray [

	<primitive: 'primitiveAddFloatArray' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) + (floatArray at: i)].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primAddScalar: scalarValue [

	<primitive: 'primitiveAddScalar' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) + scalarValue].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primDivArray: floatArray [

	<primitive: 'primitiveDivFloatArray' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) / (floatArray at: i)].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primDivScalar: scalarValue [

	<primitive: 'primitiveDivScalar' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) / scalarValue].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primMulArray: floatArray [

	<primitive: 'primitiveMulFloatArray' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) * (floatArray at: i)].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primMulScalar: scalarValue [

	<primitive: 'primitiveMulScalar' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) * scalarValue].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primSubArray: floatArray [

	<primitive: 'primitiveSubFloatArray' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) - (floatArray at: i)].
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>primSubScalar: scalarValue [

	<primitive: 'primitiveSubScalar' module: 'FloatArrayPlugin'>
	1 to: self size do:[:i| self at: i put: (self at: i) - scalarValue].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>replaceFrom: start to: stop with: replacement startingAt: repStart  [
	"Primitive. This destructively replaces elements from start to stop in the receiver starting at index, repStart, in the collection, replacement. Answer the receiver. Range checks are performed in the primitive only. Optional. See Object documentation whatIsAPrimitive."
	<primitive: 105>
	super replaceFrom: start to: stop with: replacement startingAt: repStart
]

{
	#category : #primitives-plugin,
	#timestamp : ' 8/31/2017 07:16:28'
}
FloatArray>>sum [

	<primitive: 'primitiveSum' module: 'FloatArrayPlugin'>
	^ super sum
]
