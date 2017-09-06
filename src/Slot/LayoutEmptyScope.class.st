"
I am the last layout scope in a scope chain.
"
Class {
	#name : #LayoutEmptyScope,
	#superclass : #LayoutAbstractScope,
	#classInstVars : [
		'instance'
	],
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope class>>instance [
	^ instance ifNil: [ instance := self new ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>allSlotsDo: aBlock [

]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>allSlotsReverseDo: aBlock [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>allVisibleSlots [
	^ OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>fieldSize [
	^ 0
]

{
	#category : #flattening,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>flatten [
	^ OrderedCollection new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>hasFields [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>hasSlots [
	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>ifNotEmpty: aBlock [
	"This scope is empty so we do nothing"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>ownFieldSize [
	^ 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>visibleSlots [
	^ #()
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutEmptyScope>>withParentScopesDo: aBlock [
	aBlock value: self.
]
