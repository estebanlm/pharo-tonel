"
WordArrays store 32-bit unsigned Integer values.

"
Class {
	#name : #WordArray,
	#superclass : #ArrayedCollection,
	#type : #words,
	#category : #Collections-Native,
	#timestamp : '<historical>'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>asWordArray [
	^self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>atAllPut: value [
	"Fill the receiver with the given value"

	<primitive: 145>
	super atAllPut: value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>byteSize [
	^self size * 4
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>defaultElement [
	"Return the default element of the receiver"
	^0
]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primAddArray: rcvr and: other into: result [

	<primitive: 'primitiveAddArrays' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveAddArrays."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) + (other at: i)
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primAddScalar: rcvr and: other into: result [

	<primitive: 'primitiveAddScalar' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveAddScalar."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) + other.
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primDivArray: rcvr and: other into: result [

	<primitive: 'primitiveDivArrays' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveDivArrays."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) / (other at: i)
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primDivScalar: rcvr and: other into: result [

	<primitive: 'primitiveDivScalar' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveDivScalar."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) / other.
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primMulArray: rcvr and: other into: result [

	<primitive: 'primitiveMulArrays' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveMulArrays."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) * (other at: i)
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primMulScalar: rcvr and: other into: result [

	<primitive: 'primitiveMulScalar' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveMulScalar."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) * other.
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primSubArray: rcvr and: other into: result [

	<primitive: 'primitiveSubArrays' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveSubArrays."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) - (other at: i)
	].
	^ result.

]

{
	#category : #'array arithmetic primitives',
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>primSubScalar: rcvr and: other into: result [

	<primitive: 'primitiveSubScalar' module:'KedamaPlugin'>
	"^ KedamaPlugin doPrimitive: #primitiveSubScalar."

	1 to: rcvr size do: [:i |
		result at: i put: (rcvr at: i) - other.
	].
	^ result.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:28'
}
WordArray>>replaceFrom: start to: stop with: replacement startingAt: repStart  [
	<primitive: 105>
	^super replaceFrom: start to: stop with: replacement startingAt: repStart 
]
