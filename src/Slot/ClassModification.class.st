"
I represent a modification in a class. 
"
Class {
	#name : #ClassModification,
	#superclass : #AbstractClassModification,
	#instVars : [
		'superclass',
		'additions',
		'removals',
		'changes',
		'slotShift',
		'methodModification',
		'copies',
		'traitComposition',
		'classVariables',
		'sharedPools'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification class>>modify: aClass extend: aSuperclass withLayoutType: layoutClass slots: someSlots sharedVariables: someClassVariables sharedPools: someSharedPools traitComposition: aTraitComposition  [
	^ self new
		target: aClass;
		superclass: aSuperclass;
		traitComposition: aTraitComposition;
		classVariables: someClassVariables;
		sharedPools: someSharedPools;
		layoutClass: layoutClass slots: someSlots;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>additions [
	^ additions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>additions: aCollection [
	additions := aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>buildModificationMapFor: aModification [
	aModification slotShift: (ShiftedField new shift: slotShift).
	
	aModification size = 0 
		ifTrue: [ ^ aModification ].
	
	additions do: [ :slot | 
		self installSlotAddition: slot on: aModification].
	
	changes keysAndValuesDo: [ :newSlot :oldSlot | 
		self installSlotChangeFrom: oldSlot to: newSlot on: aModification ].
	
	removals do: [ :slot | 
		self installSlotRemoval: slot on: aModification].
	
	copies keysAndValuesDo: [ :newSlot :oldSlot | 
		self installSlotCopiedFrom: oldSlot to: newSlot on: aModification ].
	
	^ aModification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>changes [
	^ changes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>classVariables [
	
	^ classVariables
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>classVariables: anObject [
	
	classVariables := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>computeChange [
	super computeChange.
	layout computeChangesFrom: target classLayout in: self.
	slotShift := layout fieldSize - target classLayout fieldSize.
	self propagate.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>copies [
	^ copies
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>initialize [
	super initialize.
	changes := IdentityDictionary new.
	copies := IdentityDictionary new.
	removals := {}.
	additions := {}.
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>installSlotAddition: slot on: aModification [
	0 to: slot size - 1 do: [ :idx |
		(AddedField new
			newSlot: slot;
			fieldIndex: idx) installOn: aModification  ]
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>installSlotChangeFrom: oldSlot to: newSlot on: aModification [
	0 to: newSlot size - 1 do: [ :idx |
 		(ModifiedField new
			newSlot: newSlot;
			originalSlot: oldSlot;
			fieldIndex: idx) installOn: aModification ]
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>installSlotCopiedFrom: oldSlot to: newSlot on: aModification [
	0 to: newSlot size - 1 do: [ :idx |
 		(UnmodifiedField new
			slot: newSlot;
			fieldIndex: idx) installOn: aModification ]
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>installSlotRemoval: slot on: aModification [
	0 to: slot size - 1 do: [ :idx |
		(RemovedField new
			originalSlot: slot;
			fieldIndex: idx) installOn: aModification ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>instanceModification [
	| map |
	map := InstanceModification new: layout fieldSize.
	^ self buildModificationMapFor: map
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>isPropagation [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>layoutClass: layoutClass slots: slotArray [
	| parentLayout newScope newLayout |
	parentLayout := self superLayout.
	newScope := parentLayout slotScope extend: slotArray.
	newLayout := layoutClass extending: parentLayout scope: newScope host: self target.
	self layout: newLayout
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>methodModification [
	^ methodModification ifNil: [
		methodModification := MethodModification new: target classLayout fieldSize.
		self buildModificationMapFor: methodModification ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>modifiesClassVariables [
	"Note: The meta class has the same class variables as it's non-meta class"

	^ target isInstanceSide and: [ target classVariables ~= classVariables ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>modifiesFormat [

	^ (layout format = target classLayout format) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>modifiesSharedPools [

	^ (target sharedPoolsString = sharedPools) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>modifiesSlots [

	^ (changes isEmpty and: [ removals isEmpty and: [ additions isEmpty ]]) not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>modifiesSuperclass [

	^ (target superclass == superclass) not
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>newScope [
	^ layout slotScope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>originalScope [
	^ target classLayout slotScope
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>removals [
	^ removals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>removals: aCollection [
	removals := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>sharedPools [
	
	^ sharedPools
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>sharedPools: anObject [
	
	sharedPools := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>slotShift [
	^ slotShift
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>superLayout [
	^ superclass
		ifNil: [ EmptyLayout instance ]
		ifNotNil: [ superclass classLayout ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>superclass [
	^ superclass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>superclass: aClass [
	superclass := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>traitComposition [
	^ traitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
ClassModification>>traitComposition: aTraitComposition [
	" We copy the trait composition since we might want "
	" to update the slot indices if the composition is partly stateful "
	traitComposition := aTraitComposition copyTraitExpression
]
