"
I represent the change of a removed field on an instance.
"
Class {
	#name : #RemovedField,
	#superclass : #AbstractFieldModification,
	#instVars : [
		'originalSlot'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
RemovedField>>installOn: aModification [
	aModification installRemovedSlot: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
RemovedField>>oldFieldIndex [
	^ originalSlot index + fieldIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
RemovedField>>originalSlot [
	^ originalSlot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
RemovedField>>originalSlot: anObject [
	originalSlot := anObject
]
