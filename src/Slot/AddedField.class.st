"
I represent the change of a newly added field on an instance.
"
Class {
	#name : #AddedField,
	#superclass : #AbstractFieldModification,
	#instVars : [
		'newSlot'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AddedField>>installOn: aModification [
	aModification installAddedSlot: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AddedField>>name [
	^ newSlot name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AddedField>>newFieldIndex [
	^ newSlot index + fieldIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AddedField>>newSlot [
	^ newSlot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AddedField>>newSlot: anObject [
	newSlot := anObject
]
