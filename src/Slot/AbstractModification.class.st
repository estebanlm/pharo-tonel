"
Modifications to a high-level class have an impact on the related low-level structures. There are two modification models that transform the high-level model into concrete low-level modifications models, the method modification model and the instance modification model. Both models list for every field, whether it was added, removed, or shifted to a new position.

Instance Variables:
	slotShift	<Integer>
	modificationMap	<(Collection of: AbstractFieldModification)>
"
Class {
	#name : #AbstractModification,
	#superclass : #Object,
	#instVars : [
		'slotShift',
		'modificationMap'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification class>>new: anInteger [
	^ self new initialize: anInteger 
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>initialize: anInteger [
	self initialize.
	modificationMap := Array new: anInteger.
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>installAddedSlot: addedSlot [
	self subclassResponsibility
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>installModifiedSlot: modifiedSlot [
	self subclassResponsibility
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>installRemovedSlot: removedSlot [
	self subclassResponsibility
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>installUnmodifiedSlot: unmodifiedSlot [
	modificationMap
		at: unmodifiedSlot fieldIndex
		put: unmodifiedSlot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>modificationAt: idx [
	idx > modificationMap size 
		ifTrue: [ ^ slotShift ].
	^ modificationMap at: idx
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>size [
	^ modificationMap size.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractModification>>slotShift: aShift [
	slotShift := aShift
]
