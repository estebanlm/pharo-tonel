"
I take a ready class and install it in a given environment.
My sublcasses implement custom strategies.
"
Class {
	#name : #AbstractClassInstaller,
	#superclass : #Object,
	#instVars : [
		'builder'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller class>>make: aBlock [
	| builder |
	builder := self new builder.
	aBlock value: builder.
	^ builder build
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>builder [
	^ builder
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>classAdded: aClass inCategory: aCategory [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>classAt: aName ifAbsent: aBlock [
	self subclassResponsibility
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>classDefinitionDeeplyChangedFrom: oldClass to: newClass by: classModification [
	self subclassResponsibility
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>classDefinitionShallowChangedFrom: oldClass to: newClass by: classModification [
	self subclassResponsibility
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>copyTraitCompositionFrom: oldClass to: newClass [
(oldClass traitComposition syntacticallyEquals: newClass traitComposition )ifTrue:[^ self ].
	self 
		installTraitComposition: oldClass traitComposition copyTraitExpression 
		on: newClass.
	"We have to manually unsubcribe the newClass from its traits. Later in the class-building phase newClass becomeForward: oldClass and hence we can no longer distinguish the two. Which would leave `newClass trait users`, an IdetitySet, in an invalid state, as it's elements have been modified (the becomeForward:) without a proper rehash."
	newClass traitComposition traits do: [ :trait |
		trait removeUser: newClass ].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>environment [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>environment: anEnvironment [
	self subclassResponsibility
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>initialize [
	builder := SlotClassBuilder new.
	builder installer: self
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>installTraitComposition: aTraitComposition on: aClass [
	self flag: 'Should probably send something else to test'.
	aClass setTraitComposition: aTraitComposition
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>migrateClasses: old to: new using: anInstanceModification [
	self subclassResponsibility
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AbstractClassInstaller>>recategorize: aClass to: aCategory [
	self subclassResponsibility
]
