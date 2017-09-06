"
I'm responsible for building and verifying new classes. 
The update and modification/installation of classes are managed by installers (AbstractClassInstallation).

The class builder is responsible for the structural part of modifying a class or creating a new class. It relies on the installer to fetch the old version of the class. It then uses the class modification model to compute the method modification and instance modification models. It then validates if these changes are semantically sound.

Example:
	see PharoClassInstaller
"
Class {
	#name : #SlotClassBuilder,
	#superclass : #Object,
	#instVars : [
		'installer',
		'oldClasses',
		'newClasses',
		'classSlots',
		'category',
		'superclass',
		'name',
		'layoutClass',
		'slots',
		'traitComposition',
		'classTraitComposition',
		'result',
		'sharedPoolsString',
		'sharedVariables',
		'comment',
		'commentStamp'
	],
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>apply: classModification [

	classModification modifiesSlots
		ifTrue: [self applySlotChange: classModification]
		ifFalse: [ 
			classModification modifiesFormat
				ifTrue: [ self applyFormatChange: classModification]
				ifFalse: [
					classModification modifiesSuperclass
						ifTrue: [ self applySuperclassChange: classModification ]
						ifFalse: [ 
							(classModification modifiesSharedPools or: [ classModification modifiesClassVariables ])
								ifTrue: [ self applySharedVariableOrPoolChange: classModification ]
								ifFalse: [ 
									"Note: In the other cases of this evil if nesting, the trait composition is set
									by the installer."
									^ self installTraitComposition: classModification ] ]]].
	
	self 
		migrateClasses: classModification;
		cleanUp
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applyAndUpdateFormat: classModification [
	^ self track: classModification during: [ :old :new |
		installer formatChangedFrom: old to: new by: classModification ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applyAndUpdateSharedVariableOrSharedPool: classModification [
	^ self track: classModification during: [ :old :new |
		installer sharedVariableOrSharedPoolChangedFrom: old to:  new by: classModification ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applyAndUpdateSlots: classModification [
	^ self track: classModification during: [ :old :new |
		installer slotsChangedFrom: old to: new by: classModification ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applyAndUpdateSuperclass: classModification [
	^ self track: classModification during: [ :old :new |
		installer superclassChangedFrom: old to: new by: classModification ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applyFormatChange: classModification [
	result := self applyAndUpdateFormat: classModification.
	classModification allPropagationsDo: [ :propagation | 
		self applyAndUpdateFormat: propagation ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applySharedVariableOrPoolChange: classModification [
	"This method updates both shared variables and shared pools since they use the same mechanism"
	result := self applyAndUpdateSharedVariableOrSharedPool: classModification.
	classModification allPropagationsDo: [ :propagation | 
		self applyAndUpdateSharedVariableOrSharedPool: propagation ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applySlotChange: classModification [
	result := self applyAndUpdateSlots: classModification.
	classModification allPropagationsDo: [ :propagation | 
		self applyAndUpdateSlots: propagation ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>applySuperclassChange: classModification [
	result := self applyAndUpdateSuperclass: classModification.
	classModification allPropagationsDo: [ :propagation | 
		self applyAndUpdateSuperclass: propagation ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>build [
	| oldClass metaChange classChange |
	result := oldClass := installer classAt: name ifAbsent: [ ^ self buildNewClass ].

	self validateSuperChain: oldClass.
	
	metaChange := ClassModification
							modify: oldClass class
							extend: self superMetaclass
							withLayoutType: FixedLayout
							slots: classSlots
							sharedVariables: #()
							sharedPools: ''
							traitComposition: classTraitComposition.
	
	classChange := ClassModification
							modify: oldClass
							extend: superclass
							withLayoutType: self layoutClass
							slots: slots
							sharedVariables: sharedVariables
							sharedPools: sharedPoolsString
							traitComposition: traitComposition.

	self apply: metaChange.
	self apply: classChange.

	comment ifNotNil: [result classComment: comment stamp: commentStamp].

	result instanceSide 
		declareClassVariables: sharedVariables;
		sharing: sharedPoolsString.

	result isMeta ifFalse: [
		installer recategorize: result to: category ].
	
	"call all slots and allow them to modify the class"
	classChange additions do: [ :each | each installingIn: result].
	classChange changes do: [ :each | each changingIn: result ].
	classChange removals do: [ :each | each removingFrom: result].
	result classLayout slots do: [ :each | each layoutChanged: result]. 

	metaChange additions do: [ :each | each installingIn: result].
	metaChange changes do: [ :each | each changingIn: result ].
	metaChange removals do: [ :each | each removingFrom: result].
	
	"We announce both instance and class sides modification events 
	according to previous behaviour of #apply method (self apply: classChange and metaChange)"
	SystemAnnouncer uniqueInstance 
		classModificationAppliedTo: result instanceSide;
		classModificationAppliedTo: result classSide.
		
	^ result instanceSide
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>buildNewClass [
	| metaclass newClass |
	metaclass := Metaclass new.
	metaclass
		superclass: self superMetaclass
		withLayoutType: FixedLayout
		slots: classSlots.

	newClass := metaclass new.
	newClass setName: name.
	
	newClass
		superclass: superclass
		withLayoutType: self layoutClass
		slots: slots.

	newClass declareClassVariables: sharedVariables.
	newClass sharing: sharedPoolsString.
	
	comment ifNotNil: [newClass classComment: comment stamp: commentStamp].
	
	installer classAdded: newClass inCategory: category.
	
	installer installTraitComposition: traitComposition on: newClass.
	installer installTraitComposition: classTraitComposition on: metaclass.
	
	newClass classLayout slots do: [ :each | each installingIn: newClass].
	newClass classLayout slots do: [ :each | each layoutChanged: newClass].
	^ newClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>category: aCategory [
	aCategory isEmpty ifTrue: [ InvalidPackageName signal: 'The Category should not be empty' ].
	category := aCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>classSlots: someClassSlots [
	classSlots := someClassSlots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>classTraitComposition: aTraitComposition [
	classTraitComposition := aTraitComposition asTraitComposition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>cleanUp [
	
	oldClasses removeAll.
	newClasses removeAll.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>comment: aString [
	comment := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>comment: aString stamp: aStamp [
	comment := aString.
	commentStamp := aStamp.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>copyClassSlotsFromExistingClass [
	"Ugly helper method: I copy over the class slots of the class in my builder environment."

	| oldClass oldSlots |
	oldClass := self environment at: name ifAbsent: [ ^ self ].

	oldSlots := oldClass class classLayout slotScope visibleSlots.
	self classSlots:(oldSlots collect: [ :e | e copy index: nil; yourself ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>environment [
	^ installer environment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>environment: globals [
	installer environment: globals
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>initialize [
	super initialize.
	oldClasses := OrderedCollection new.
	newClasses := OrderedCollection new.
	sharedPoolsString := ''.
	sharedVariables := {}.
	classSlots := {}.
	slots := {}.
	superclass := Object.
	classTraitComposition := {} asTraitComposition.
	traitComposition := {} asTraitComposition.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>installTraitComposition: classModification [
	installer
		installTraitComposition: classModification traitComposition
		on: classModification target.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>installer: anInstaller [
	installer := anInstaller
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>layoutClass [
	"If not specified the layout class is the same as the superclass"
	^ layoutClass ifNil: [ layoutClass := superclass classLayout class ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>layoutClass: aLayoutClass [
	layoutClass := aLayoutClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>migrateClasses: classModification [
	| dependantClasses |
	
	installer
		migrateClasses: oldClasses asArray
		to: newClasses asArray
		using: classModification instanceModification.

	"we announce events only about dependant classes because here we are not finished current class modification (result variable)"
	dependantClasses := newClasses copyWithoutAll: { result instanceSide. result classSide }.
	dependantClasses do: [ :each | 
		SystemAnnouncer uniqueInstance classModificationAppliedTo: each  ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>name: aName [
	aName ifNil: [ ^self "for anonymous classes" ].
	[ name := aName asSymbol ]
		on: Error 
		do: [ InvalidGlobalName 
				signal: 'Global names should be symbols' 
				for: aName ].
	self validateClassName.
	self warnOfDangerousClasses.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>sharedPools: poolString  [
	sharedPoolsString := poolString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>sharedVariables: anArray  [
	sharedVariables := anArray collect: [ :each | each asClassVariable ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>sharedVariablesFromString: aString  [
	sharedVariables :=  (aString substrings: ' ') collect: [:x | x asSymbol => ClassVariable]. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>slots: someSlots [
	slots := someSlots
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>superMetaclass [
	 ^ superclass ifNil: [ Class ] ifNotNil: [ superclass class ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>superclass: aSuperclass [
	superclass := aSuperclass.
	superclass ifNotNil: [ self validateSuperclass: superclass ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>track: classModification during: aBlock [
	| old new |
	old := classModification target.
	new := classModification apply.

	aBlock value: old value: new.
	
	" Store the modification for updateClasses "
	oldClasses add: old.
	newClasses add: new.
	^ new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>traitComposition: aTraitComposition [
	traitComposition := aTraitComposition asTraitComposition
]

{
	#category : #'private validating',
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>validateClassName [
	"Validate the new class name. Raise warning if invalid."
	name isValidGlobalName ifFalse: [ 
		InvalidGlobalName signal: 'Class name is not a valid global name. It must start with uppercase letter and continue with alphanumeric characters or underscore. Default names used in class or trait templates are not allowed.' for: name  ].
]

{
	#category : #'private validating',
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>validateSuperChain: oldClass [
	superclass ifNil: [ ^ nil ].
	superclass withAllSuperclassesDo: [ :class |
		class == oldClass
			ifTrue: [ CircularHierarchyError signalFor: oldClass ]].
]

{
	#category : #'private validating',
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>validateSuperclass: anObject [
	anObject isBehavior ifFalse: [ 
		InvalidSuperclass 
			signal: 'Trying to build classes from non-class objects'
			for: anObject ].

	anObject isMeta ifTrue: [ 
		InvalidSuperclass 
			signal: 'Metaclasses cannot be used for building classes'
			for: anObject ].
]

{
	#category : #'private validating',
	#timestamp : ' 8/31/2017 07:16:35'
}
SlotClassBuilder>>warnOfDangerousClasses [
	DangerousClassNotifier check: name 
]
