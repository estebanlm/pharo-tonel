"
A MCDependencySorter computes the dependencies to a set of entities.
"
Class {
	#name : #MCDependencySorter,
	#superclass : #Object,
	#instVars : [
		'required',
		'provided',
		'orderedItems'
	],
	#category : #Monticello-Loading,
	#timestamp : '<historical>'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter class>>items: aCollection [
	^ self new addAll: aCollection
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter class>>sortItems: aCollection [
	| sorter |
	sorter := self items: aCollection.
	sorter externalRequirements do: [:req  | sorter addProvision: req].
	^ sorter orderedItems.
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>add: anItem [
	| requirements |
	requirements := self unresolvedRequirementsFor: anItem.
	requirements isEmpty
		ifTrue: [self addToOrder: anItem]
		ifFalse: [self addRequirements: requirements for: anItem].
	^ anItem
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>addAll: aCollection [
	aCollection asArray sort do: [:ea | self add: ea]
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>addExternalProvisions: aCollection [
	(aCollection intersection: self externalRequirements)
		do: [:ea | self addProvision: ea]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>addProvision: anObject [
	| newlySatisfied |
	provided add: anObject.
	newlySatisfied := required removeKey: anObject ifAbsent: [#()].
	self addAll: newlySatisfied.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>addRequirement: reqObject for: itemObject [
	(self itemsRequiring: reqObject) add: itemObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>addRequirements: aCollection for: anObject [
	aCollection do: [:ea | self addRequirement: ea for: anObject]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>addToOrder: anItem [
	orderedItems add: anItem.
	anItem provisions do: [:ea | self addProvision: ea].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>externalRequirements [
	| unloaded providedByUnloaded |
	unloaded := self itemsWithMissingRequirements.
	providedByUnloaded := (unloaded flatCollect: [:e | e provisions]) asSet.
	^ required keys reject: [:ea | providedByUnloaded includes: ea ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>initialize [
	super initialize.
	provided := Set new.
	required := Dictionary new.
	orderedItems := OrderedCollection new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>itemsRequiring: anObject [
	^ required at: anObject ifAbsentPut: [Set new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>itemsWithMissingRequirements [
	| items |
	items := Set new.
	required do: [:ea | items addAll: ea].
	^ items

]

{
	#category : #sorting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>orderedItems [
	^ orderedItems
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCDependencySorter>>unresolvedRequirementsFor: anItem [
	^ anItem requirements difference: provided
]
