"
I collect and provide the information to update methods when a class changed.
"
Class {
	#name : #MethodModification,
	#superclass : #AbstractModification,
	#instVars : [
		'addedSlots'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodModification>>addedSlotNamed: name ifAbsent: aBlock [
	^ addedSlots at: name ifAbsent: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodModification>>initialize [
	addedSlots := Dictionary new
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodModification>>installAddedSlot: addedSlot [
	addedSlots at: addedSlot name put: addedSlot
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodModification>>installModifiedSlot: modifiedSlot [
	modificationMap at: modifiedSlot oldFieldIndex put: modifiedSlot
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
MethodModification>>installRemovedSlot: removedSlot [
	modificationMap at: removedSlot oldFieldIndex put: removedSlot
]
