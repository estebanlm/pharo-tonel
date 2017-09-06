"
Empty top-level layout used to delimit the layout chains.
"
Class {
	#name : #EmptyLayout,
	#superclass : #AbstractLayout,
	#classInstVars : [
		'instance'
	],
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
EmptyLayout class>>instance [
	^ instance ifNil: [ instance := self new ]
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
EmptyLayout>>extend: someSlots [
	^ FixedLayout new
		slotScope: (LayoutEmptyScope instance extend: someSlots)
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
EmptyLayout>>extendByte [
	^ ByteLayout new
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
EmptyLayout>>extendVariable: someSlots [
	^ VariableLayout new
		slotScope: (LayoutEmptyScope extend: someSlots)
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
EmptyLayout>>extendWeak [
	^ WeakLayout new
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
EmptyLayout>>extendWord [
	^ WordLayout new
]
