"
I am the default class installer.
I install a new or modified class in the globals dictionary and announce this change publicly.

The default environment can be changed to any SystemDictionary.

Example:
	PharoClassInstaller example
"
Class {
	#name : #PharoClassInstaller,
	#superclass : #AbstractClassInstaller,
	#instVars : [
		'environment',
		'instanceModification',
		'methodUpdateStrategy'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #example,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller class>>example [
	^ PharoClassInstaller make: [ :aSlotClassBuilder |
		aSlotClassBuilder
			superclass: Object;
			name: #MyClass;
			slots: #(varA varB);
			category: 'My-Category' ].
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller class>>validateClassName: aString [
	"Validate if a string can be the name of a new class. Raise an error if not."
	
	self new builder name: aString.
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>basicClassDefinitionChangedFrom: oldClass to: newClass using: classModification [

	" Copy over the trait composition "
	self copyTraitCompositionFrom: oldClass to: newClass.		
	" Copy over the method organization "
	newClass organization: oldClass organization.
	" Update the subclass links "
	oldClass superclass == newClass superclass ifFalse: [ 
		oldClass superclass removeSubclass: oldClass.
		newClass superclass addSubclass: newClass ].
	" Announce if necessary "
	classModification isPropagation ifFalse: [ 
		self systemAnnouncer classDefinitionChangedFrom: oldClass to: newClass ].
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>classAdded: aClass inCategory: aCategory [
	" Install the new class in the system "
	environment at: aClass name put: aClass.
	environment flushClassNameCache.
	
	" Update the system's organization "
	environment organization ifNotNil: [:org | org classify: aClass name under: aCategory].
	aClass environment: environment.

	" Inform superclass of new subclass "
	aClass superclass addSubclass: aClass.	
		
	self systemAnnouncer classAdded: aClass inCategory: aCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>classAt: aName ifAbsent: aBlock [
	^ (environment at: aName ifAbsent: aBlock)
		ifNil: aBlock
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>classDefinitionChangedFrom: oldClass to: newClass by: classModification [
	
	self
		copyMethodsFrom: oldClass to: newClass using: classModification;
		basicClassDefinitionChangedFrom: oldClass to: newClass using: classModification;
		fixClassBindings: newClass
	
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>copyMethodsFrom: oldClass to: newClass using: classModification [
	methodUpdateStrategy
		transform: oldClass
		to: newClass
		using: classModification methodModification
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>environment [
	^ environment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>environment: anEnvironment [
	environment := anEnvironment
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>fixClassBindings: newClass [
	methodUpdateStrategy updateClassLiteralKeysIn: newClass
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>formatChangedFrom: oldClass to: newClass by: classModification [

	self 
		classDefinitionChangedFrom: oldClass 
		to: newClass 
		by: classModification
	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>initialize [
	super initialize.
	environment := nil environment.
	methodUpdateStrategy := MethodRecompileStrategy new.
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>migrateClasses: old to: new using: anInstanceModification [
	instanceModification := anInstanceModification.
	old ifEmpty:  [ ^ self ].
	[
		1 to: old size do: [ :index |
			self updateClass: (old at: index) to: (new at: index)].
		old elementsForwardIdentityTo: new.
		" Garbage collect away the zombie instances left behind in garbage memory in #updateInstancesFrom: "
		" If we don't clean up this garbage, a second update would revive them with a wrong layout! "
		" (newClass rather than oldClass, since they are now both newClass) "
		Smalltalk garbageCollect.
	] valueUnpreemptively
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>recategorize: aClass to: newCategory [
	| oldCategory |
	
	oldCategory := aClass category.
	oldCategory asSymbol == newCategory asSymbol
		ifTrue: [ ^ self ].
		
	environment organization 
		classify: aClass name 
		under: newCategory.
		
	self systemAnnouncer 
		class: aClass 
		recategorizedFrom: oldCategory 
		to: newCategory
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>shallowClassDefinitionChangedFrom: oldClass to: newClass by: classModification [
	" Copy over the method organization "
	" Update the superclass links "
	self 
		shallowCopyMethodsFrom: oldClass to: newClass using: classModification;
		basicClassDefinitionChangedFrom: oldClass to: newClass using: classModification
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>shallowCopyMethodsFrom: oldClass to: newClass using: classModification [
	newClass methodDict: oldClass methodDict
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>sharedVariableOrSharedPoolChangedFrom: oldClass to: newClass by: classModification  [

	self 
		classDefinitionChangedFrom: oldClass 
		to: newClass 
		by: classModification.
	
	"for every class var in the classModification: if this exists in oldClass, copy value over"
	classModification classVariables do: [ :each | 
		(oldClass hasClassVarNamed: each name) ifTrue: [
			each write: (oldClass classVariableNamed: each name) value  ]].
	
	"Update subclasses. No need to propagate the modification to them."
	oldClass subclasses do: [ :each |
		each superclass: newClass.
		newClass addSubclass: each.
		each classLayout slotScope ifNotEmpty: [ :scope | scope parentScope: newClass classLayout slotScope ] ].
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>slotsChangedFrom: oldClass to: newClass by: classModification [
	
	self
		classDefinitionChangedFrom: oldClass 
		to: newClass 
		by: classModification
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>superclassChangedFrom: oldClass to: newClass by: classModification [

	self 
		shallowClassDefinitionChangedFrom: oldClass
		to: newClass
		by: classModification 
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>systemAnnouncer [
	^ SystemAnnouncer uniqueInstance
]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
PharoClassInstaller>>updateClass: oldClass to: newClass [
	newClass updateInstancesFrom: oldClass
]
