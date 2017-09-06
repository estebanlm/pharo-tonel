"
I am an abstract field modification.
Field modifications encapsulate the changes required to migrated instances.
"
Class {
	#name : #AbstractFieldModification,
	#superclass : #Object,
	#instVars : [
		'fieldIndex'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractFieldModification>>fieldIndex [
	^ fieldIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractFieldModification>>fieldIndex: anObject [
	fieldIndex := anObject
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractFieldModification>>installOn: aModification [
	self subclassResponsibility
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractFieldModification>>migrateAt: index to: newInstance from: oldInstance [

]
