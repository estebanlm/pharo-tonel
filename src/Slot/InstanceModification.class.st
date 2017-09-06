"
I collect and provide the information to migrate instances when a class changed.
"
Class {
	#name : #InstanceModification,
	#superclass : #AbstractModification,
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceModification>>installAddedSlot: addedSlot [
	modificationMap at: addedSlot newFieldIndex put: addedSlot
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceModification>>installModifiedSlot: modifiedSlot [
	modificationMap at: modifiedSlot newFieldIndex put: modifiedSlot
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
InstanceModification>>installRemovedSlot: removedSlot [
	" ignore "
]
