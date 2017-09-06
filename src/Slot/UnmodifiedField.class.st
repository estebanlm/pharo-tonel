"
Ceci n'est pas une modifications.
I am used to migrate non modified fields from the old to the new instance.
Typically I am used when only certain fields are modified and others are left as is.
"
Class {
	#name : #UnmodifiedField,
	#superclass : #AbstractFieldModification,
	#instVars : [
		'slot'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnmodifiedField>>fieldIndex [
	^ slot index + fieldIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnmodifiedField>>installOn: aModification [
	aModification installUnmodifiedSlot: self
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnmodifiedField>>migrateAt: index to: newInstance from: oldInstance [
	newInstance
		instVarAt: index
		put: (oldInstance instVarAt: index)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnmodifiedField>>slot [
	^ slot
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
UnmodifiedField>>slot: anObject [
	slot := anObject
]
