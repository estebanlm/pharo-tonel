"
I am layout scope for classes.
"
Class {
	#name : #LayoutClassScope,
	#superclass : #LayoutAbstractScope,
	#type : #variable,
	#instVars : [
		'parentScope'
	],
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>= other [
	super = other
		ifFalse: [ ^ false ].
	
	self size = other size
		ifFalse: [ ^ false ].
	
	1 to: self size do:  [ :index|
		(self at: index) = (other at: index)
			ifFalse: [ ^ false ]].
	
	^ self parentScope = other parentScope.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>allSlotsDo: aBlock [
	parentScope allSlotsDo: aBlock.
	self do: aBlock
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>allSlotsReverseDo: aBlock [
	self reverseDo: aBlock.
	parentScope allSlotsReverseDo: aBlock.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>allVisibleSlots [
	| result |
	result := parentScope allVisibleSlots.
	self do: [ :slot | 
		slot isVisible 
			ifTrue: [ result add: slot ]].
	^ result
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>do: aBlock [
	1 to: self size do: [ :index |
		aBlock value: (self at: index) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>fieldSize [
	^ parentScope fieldSize + self ownFieldSize.
]

{
	#category : #flattening,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>flatten [
	| result |
	result := parentScope flatten.
	result addAll: self.
	^ result
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>hasFields [
	self do: [ :slot | 
		slot size > 0 
			ifTrue: [ ^ true ]].
	^ parentScope hasFields
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>hasSlots [
	self size > 0 
		ifTrue: [ ^ true ].
	^ parentScope hasSlots
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>hash [
	| hash |
	hash := super hash.
	1 to: self size do: [ :i | 
		hash := (hash + (self at: i) hash) hashMultiply].
	^ hash + self parentScope hash hashMultiply.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>ifNotEmpty: aBlock [
	"This scope is not empty so we evaluate the block"
	aBlock value: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>ownFieldSize [
	|result|
	result := 0.
	self do: [ :slot | result := result + slot size ].
	^ result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>parentScope [
	^ parentScope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>parentScope: aLayoutScope [
	parentScope := aLayoutScope
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>postCopy [
	parentScope := parentScope copy.
	1 to: self size do: [ :index | 
		self at: index put: (self at: index) copy ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>printOn: aStream [
	
	super printOn: aStream.
	self allVisibleSlots printElementsOn: aStream.
]

{
	#category : #reshaping,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>rebase: originalScope to: newScope [
	| newParent result fieldIndex |
	newParent := parentScope == originalScope
		ifTrue: [ newScope ]
		ifFalse: [ parentScope rebase: originalScope to: newScope ].
		
	result := self copy.
	result parentScope: newParent.
	
	fieldIndex := newParent firstFieldIndex.
	result do: [ :slot | 
		slot isVirtual ifFalse: [slot index: fieldIndex].
		fieldIndex := fieldIndex + slot size ].
	
	^ result
	
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>reverseDo: aBlock [
	|size|
	size := self size.
	1 to: size do: [ :index |
		aBlock value: (self at: (1 + size - index)) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>slots [
	| result |
	result := OrderedCollection new.
	self do: [ :slot |  result add: slot].
	^ result asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>visibleSlots [
	| result |
	result := OrderedCollection new.
	self do: [ :slot | 
		slot isVisible 
			ifTrue: [ result add: slot ]].
	^ result asArray
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>withIndexDo: elementAndIndexBlock  [
	"Just like with:do: except that the iteration index supplies the second argument to the block."
	1 to: self size do:
		[:index |
		elementAndIndexBlock
			value: (self at: index)
			value: index]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:35'
}
LayoutClassScope>>withParentScopesDo: aBlock [
	aBlock value: self.
	parentScope withParentScopesDo: aBlock.
]
