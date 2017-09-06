"
Kernel trait for applying on the class side
"
Trait {
	#name : #TApplyingOnClassSide,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Traits-Kernel-Traits,
	#timestamp : 'TorstenBergmann 2/4/2014 20:36'
}

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>acceptsLoggingOfCompilation [
	"Answer whether the receiver's method submisions and class defintions should be logged to the changes file and to the current change set.  The metaclass follows the rule of the class itself."

	^ self theNonMetaClass acceptsLoggingOfCompilation
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>addInstVarNamed: aString  [
	"Add the argument, aString, as one of the receiver's instance variables."

	| fullString |
	fullString := String streamContents: [:strm |
		self instVarNames do: [:aString2 | strm nextPutAll: aString2; space].
		strm nextPutAll: aString].
	self instanceVariableNames: fullString
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>addObsoleteSubclass: aClass [
	"Do nothing."
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>addSubclass: aClass [
	"Do nothing."
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>adoptInstance: oldInstance from: oldMetaClass  [
	^self explicitRequirement.
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>assertConsistantCompositionsForNew: aTraitComposition [
	"Applying or modifying a trait composition on the class side
	of a behavior has some restrictions."

	| baseTraits notAddable message |
	baseTraits := aTraitComposition traits select: [:each | each isBaseTrait].
	baseTraits isEmpty ifFalse: [
		notAddable := (baseTraits reject: [:each | each classSide methodDict isEmpty]).
		notAddable isEmpty ifFalse: [
			message := String streamContents: [:stream |
				stream nextPutAll: 'You can not add the base trait(s)'; cr.
				notAddable
					do: [:each | stream nextPutAll: each name]
					separatedBy: [ stream nextPutAll: ', '].
				stream cr; nextPutAll: 'to this composition because it/they define(s) methods on the class side.'].
		^TraitCompositionException signal: message]].
		
	(self instanceSide traitComposition traits asSet =
			(aTraitComposition traits
				select: [:each | each isClassTrait]
				thenCollect: [:each | each baseTrait]) asSet) ifFalse: [
				^TraitCompositionException signal: 'You can not add or remove class side traits on
				the class side of a composition. (But you can specify aliases or exclusions
				for existing traits or add a trait which does not have any methods on the class side.)']
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>binding [
	"return an association that can be used as the binding
	 To share it between methods, reuse an existing one if possible"
	^self methodDict 
		ifEmpty: [nil -> self]
		ifNotEmpty: [:dict | dict anyOne classBinding]
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>bindingOf: varName [

	^self theNonMetaClass classBindingOf: varName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>canZapMethodDictionary [
	"Return true if it is safe to zap the method dictionary on #obsolete"
	self soleInstance == nil
		ifTrue:[^true]
		ifFalse:[^self soleInstance canZapMethodDictionary]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>category [
	^ self theNonMetaClass category
]

{
	#category : #'pool variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>classPool [
	"Answer the dictionary of class variables."

	^self theNonMetaClass classPool
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>classVarNames [
	"Answer a set of the names of the class variables defined in the receiver's instance."
	
	self theNonMetaClass ifNil: [ ^ Set new ].
	^self theNonMetaClass classVarNames
]

{
	#category : #fileIn/Out,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>definition [
	^self explicitRequirement.
]

{
	#category : #'accessing hierarchy protocol',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>hasClassSide [
	^false
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>initializeFrom: anotherClassTrait [
	self traitComposition: self traitComposition copyTraitExpression.
	self methodDict: self methodDict copy.
	self localSelectors: self localSelectors copy.
	self basicOrganization: self organization copy.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>instanceVariableNames: instVarString [
	^self explicitRequirement.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>isAnonymous [
	^self soleInstance isAnonymous 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>isMeta [
	^ true
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>isMetaclassOfClassOrNil [
	
	
	^ self theNonMetaClass 
		ifNil: [ true ] 
		ifNotNil: [ :nonMetaClass | nonMetaClass == Class ] 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>isObsolete [
	"Return true if the receiver is obsolete"
	^self soleInstance == nil "Either no thisClass"
		or:[self soleInstance classSide ~~ self "or I am not the class of thisClass"
			or:[self soleInstance isObsolete]] "or my instance is obsolete"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>isSelfEvaluating [
	^self isObsolete not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>isUsed [
	"Metaclasses are used by default"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>name [
	^self explicitRequirement.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>new [
	^self explicitRequirement.
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>noteNewBaseTraitCompositionApplied: aTraitComposition [
	"The argument is the new trait composition of my base trait - add
	the new traits or remove non existing traits on my class side composition.
	(Each class trait in my composition has its base trait on the instance side
	of the composition - manually added traits to the class side are always 
	base traits.)"
	
	| newComposition traitsFromInstanceSide |
	traitsFromInstanceSide := self traitComposition traits
		select: [:each | each isClassTrait]
		thenCollect: [:each | each baseTrait].
		
	newComposition := self traitComposition copyTraitExpression.
	(traitsFromInstanceSide copyWithoutAll: aTraitComposition traits) do: [:each |
		newComposition removeFromComposition: each classTrait].
	(aTraitComposition traits copyWithoutAll: traitsFromInstanceSide) do: [:each |
		newComposition add:  (each classTrait)].

	self setTraitComposition: newComposition
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>obsoleteSubclasses [
	"Answer the receiver's subclasses."

	self isMetaclassOfClassOrNil ifTrue: [ ^ #() ].

	^ self theNonMetaClass obsoleteSubclasses collect: [ :aSubclass | aSubclass theMetaClass ]
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>possibleVariablesFor: misspelled continuedFrom: oldResults [

	^ self theNonMetaClass possibleVariablesFor: misspelled continuedFrom: oldResults

]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>removeInstVarNamed: aString  [
	"Remove the argument, aString, as one of the receiver's instance variables."

	| newArray newString |
	(self instVarNames includes: aString)
		ifFalse: [self error: aString , ' is not one of my instance variables'].
	newArray := self instVarNames copyWithout: aString.
	newString := ''.
	newArray do: [:aString2 | newString := aString2 , ' ' , newString].
	self instanceVariableNames: newString
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>removeSubclass: aClass [
	"Do nothing."
]

{
	#category : #'pool variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>sharedPools [
	^OrderedCollection new.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>slots: instVarString [
	^self explicitRequirement.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>soleInstance [
	^self explicitRequirement.
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>subclasses [
	"Answer the receiver's subclasses."
	
	self isMetaclassOfClassOrNil ifTrue: [ ^ #() ].
	
	^ self theNonMetaClass subclasses collect: [ :aSubclass | aSubclass theMetaClass ].
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>subclassesDo: aBlock [
	"Evaluate aBlock for each of the receiver's immediate subclasses."
	
	self isMetaclassOfClassOrNil ifTrue: [ ^ self ].
	
	self theNonMetaClass subclasses do: [ :each | aBlock value: each theMetaClass ]
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>uses: aTraitCompositionOrArray [
	| copyOfOldTrait newComposition |
	copyOfOldTrait := self copy.
	newComposition := aTraitCompositionOrArray asTraitComposition.
	self assertConsistantCompositionsForNew: newComposition.
	self setTraitComposition: newComposition.
	SystemAnnouncer uniqueInstance
		traitDefinitionChangedFrom: copyOfOldTrait to: self;
		classModificationAppliedTo: self
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>uses: aTraitCompositionOrArray instanceVariableNames: instVarString  [
	| newComposition newMetaClass copyOfOldMetaClass |
	
	copyOfOldMetaClass := self copy.
	newMetaClass := self instanceVariableNames: instVarString.
	
	newComposition := aTraitCompositionOrArray asTraitComposition.
	newMetaClass assertConsistantCompositionsForNew: newComposition.
	newMetaClass setTraitComposition: newComposition.
	
	SystemAnnouncer uniqueInstance
		classDefinitionChangedFrom: copyOfOldMetaClass to: newMetaClass
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>uses: aTraitCompositionOrArray slots: slotArray  [
	| newComposition newMetaClass copyOfOldMetaClass |
	
	copyOfOldMetaClass := self copy.
	newMetaClass := self slots: slotArray.
	
	newComposition := aTraitCompositionOrArray asTraitComposition.
	newMetaClass assertConsistantCompositionsForNew: newComposition.
	newMetaClass setTraitComposition: newComposition.
	
	SystemAnnouncer uniqueInstance
		classDefinitionChangedFrom: copyOfOldMetaClass to: newMetaClass
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>wantsChangeSetLogging [
	"Answer whether code submitted for the receiver should be remembered by the changeSet mechanism.The metaclass follows the rule of the class itself."

	^ self theNonMetaClass wantsChangeSetLogging
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
TApplyingOnClassSide>>wantsRecompilationProgressReported [
	"The metaclass follows the rule of the class itself."

	^ self theNonMetaClass wantsRecompilationProgressReported
]
