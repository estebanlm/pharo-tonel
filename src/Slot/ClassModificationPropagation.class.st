"
I represent a modification in a class that is produced because of a change in one of its superclasses. This is called a propagation.
"
Class {
	#name : #ClassModificationPropagation,
	#superclass : #AbstractClassModification,
	#instVars : [
		'origin'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : 'MartinDias 1/28/2014 16:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation class>>propagate: aModification to: aClass [
	^ self new
		propagate: aModification
		to: aClass
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation>>apply [
	super apply.
	self copyTraitCompositionAndMethods.
	^ newClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation>>copyTraitCompositionAndMethods [
	newClass traitComposition: self target traitComposition.
	(self target methods select: #isFromTrait)
		do: [ :m | newClass methodDict at: m selector put: m ].
	newClass traitComposition allTraits
		do: [ :t | 
			t removeUser: self target.
			t addUser: newClass ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation>>isPropagation [
	^true
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation>>methodModification [
	^ origin methodModification
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation>>propagate: aModification to: aTarget [
	origin := aModification.
	target := aTarget.
	self classLayout: (target classLayout 
		reshapeFrom: origin oldLayout slotScope
		to: origin newLayout).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModificationPropagation>>superclass [
	^ origin newClass
]
