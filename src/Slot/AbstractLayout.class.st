"
I'm a container for slots.

There are special cases of layouts without slots, like NilLayout or BitsLayout.
"
Class {
	#name : #AbstractLayout,
	#superclass : #Object,
	#instVars : [
		'host'
	],
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>= other [
	^ self class = other class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>allSlots [
	^ {}
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>allSlotsDo: aBlock [
	self slotScope allSlotsDo: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>allVisibleSlots [
	^ {}
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>checkIntegrity [
	self checkSanity
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>checkSanity [
	host ifNil: [ self error: 'Host should not be nil' ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>definesSlot: aSlot  [
	^self slots identityIncludes: aSlot 
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>extendImmediate [
	^ ImmediateLayout new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>fieldSize [
	^ 0
]

{
	#category : #finalization,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>finalize [
	self allSlotsDo: [ :aSlot | aSlot finalize: self ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>hasFields [
	^ false
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>hasSlot: aSlot [
	^ self allSlots identityIncludes: aSlot 
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>hasSlotNamed: aString [
	^self allSlots anySatisfy: [:slot | slot name = aString  ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>hasSlots [
	^ false
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>hash [
	^ self class hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>host [
	^ host
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>host: aClass [
	host := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>instVarIndexFor: aString ifAbsent: aBlockClosure [
	"we do not have instance variables"
	^aBlockClosure value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>instVarNames [
	^ {}
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>isBits [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>isCustomLayout [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>isVariable [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>isWeak [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>resolveSlot: aName [
	self flag: 'Signal rather than error'.
	self error: 'No slots found'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>slotScope [
	^ LayoutEmptyScope instance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>slots [
	^ {}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractLayout>>visibleSlots [
	^self slots select: [:slot | slot isVisible]
]
