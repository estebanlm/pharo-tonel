"
Layout scopes reify how classes extend the layout of their superclass.
"
Class {
	#name : #LayoutAbstractScope,
	#superclass : #Object,
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>= other [
	^ self class = other class
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>allSlotsDo: aBlock [
	self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>allSlotsReverseDo: aBlock [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>atName: aName [
	^ self atName: aName ifAbsent: [ SlotNotFound signalForName: aName ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>atName: aName ifAbsent: aBlock [
	self allSlotsDo: [ :slot | 
		slot name == aName ifTrue: [ ^ slot ]].
	^ aBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>atName: aName ifFound: foundBlock ifNone: exceptionBlock [
	self allSlotsDo: [ :slot | 
		slot name == aName ifTrue: [ ^ foundBlock cull: slot ]].
	^ exceptionBlock value
	
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>extend [
	^ self extend: { }
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>extend: someSlots [
	^ self extend: someSlots as: LayoutClassScope
]

{
	#category : #extending,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>extend: someSlots as: type [
	| scope fieldIndex  |
	scope := type new: someSlots size.
	fieldIndex := self firstFieldIndex.
	scope parentScope: self.
	
	someSlots withIndexDo: [ :slot :slotIndex | |realSlot|
		realSlot := slot asSlot.
		realSlot scope: scope.
		realSlot isVirtual ifFalse: [realSlot index: fieldIndex].
		fieldIndex := fieldIndex + realSlot size.
		scope at: slotIndex put: realSlot ].
	^ scope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>fieldSize [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>firstFieldIndex [
	^ self fieldSize + 1
]

{
	#category : #flattening,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>flatten [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>hasFields [
	self subclassResponsibility
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>hasSlots [
	self subclassResponsibility
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>hash [
	^ self class hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>ifNotEmpty: aBlock [
	self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>indexOf: anElement [
	"Answer the index of the first occurrence of anElement within the  
	receiver. If the receiver does not contain anElement, answer 0."

	^ self indexOf: anElement ifAbsent: 0
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>indexOf: anElement ifAbsent: exceptionBlock [
	"Answer the index of the first occurence of anElement within the  
	receiver. If the receiver does not contain anElement, answer the 
	result of evaluating the argument, exceptionBlock."

	1 to: self size do:
		[:index |
		(self at: index) = anElement ifTrue: [^ index]].
	^ exceptionBlock value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>ownFieldSize [
	self subclassResponsibility
]

{
	#category : #reshaping,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>rebase: originalScope to: newScope [
	self error: 'Should not happen'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>visibleSlotNames [
	^self visibleSlots collect: [:each | each name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>visibleSlots [
	self subclassResponsibility
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutAbstractScope>>withParentScopesDo: aBlock [
	self subclassResponsibility
]
