"
While every class has an associated metaclass, a trait can have an associated classtrait, an instance of me. To preserve metaclass compatibility, the associated classtrait (if there is one) is automatically applied to the metaclass, whenever a trait is applied to a class. Consequently, a trait with an associated classtrait can only be applied to classes, whereas a trait without a classtrait can be applied to both classes and metaclasses.
"
Class {
	#name : #ClassTrait,
	#superclass : #TraitDescription,
	#instVars : [
		'baseTrait'
	],
	#category : #Traits-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait class>>for: aTrait [
	^self new
		initializeWithBaseTrait: aTrait;
		yourself
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>acceptsLoggingOfCompilation [
	"Answer whether the receiver's method submisions and class defintions should be logged to the changes file and to the current change set.  The metaclass follows the rule of the class itself."

	^ self theNonMetaClass acceptsLoggingOfCompilation
]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>addInstVarNamed: aString  [
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
ClassTrait>>addObsoleteSubclass: aClass [
	"Do nothing."
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>addSubclass: aClass [
	"Do nothing."
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>adoptInstance: oldInstance from: oldMetaClass  [
	^self error: 'Traits cannot adopt instances'.
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>assertConsistantCompositionsForNew: aTraitComposition [
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
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>baseTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	^baseTrait
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>baseTrait: aTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	[aTrait isBaseTrait] assert.
	baseTrait := aTrait
	
	
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>binding [
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
ClassTrait>>bindingOf: varName [

	^self theNonMetaClass classBindingOf: varName
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>canZapMethodDictionary [
	"Return true if it is safe to zap the method dictionary on #obsolete"
	self soleInstance == nil
		ifTrue:[^true]
		ifFalse:[^self soleInstance canZapMethodDictionary]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>category [
	^ self theNonMetaClass category
]

{
	#category : #'pool variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>classPool [
	"Answer the dictionary of class variables."

	^self theNonMetaClass classPool
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>classTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	^self
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>classTrait: aClassTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	self error: 'Trait is already a class trait!'
	
	
]

{
	#category : #'accessing instances and variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>classVarNames [
	"Answer a set of the names of the class variables defined in the receiver's instance."
	
	self theNonMetaClass ifNil: [ ^ Set new ].
	^self theNonMetaClass classVarNames
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>compile: text classified: category withStamp: changeStamp notifying: requestor logSource: logSource [
	
	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	| classSideUsersOfBaseTrait message |
	
	classSideUsersOfBaseTrait := self baseTrait traitUsers select: [:each | each isClassSide].
	
	classSideUsersOfBaseTrait isEmpty ifFalse: [
		message := String streamContents: [ :stream |
			stream nextPutAll: 'The instance side of this trait is used on '; cr.
			classSideUsersOfBaseTrait
				do: [:each | stream nextPutAll: each name ]
				separatedBy: [ stream nextPutAll: ', ' ].
			stream cr; nextPutAll: ' You can not add methods to the class side of this trait!'].
		^ TraitException signal:  message ].
	
	^ super
		compile: text
		classified: category
		withStamp: changeStamp
		notifying: requestor
		logSource: logSource
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>copy [
	"Make a copy of the receiver. Share the 
	reference to the base trait."

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	^(self class new)
		baseTrait: self baseTrait;
		initializeFrom: self;
		yourself
]

{
	#category : #fileIn/Out,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>definition [
	^String streamContents: [:stream |
		stream
			nextPutAll: self name;
			crtab;
			nextPutAll: 'uses: ';
			nextPutAll: self traitCompositionString]
]

{
	#category : #'accessing hierarchy protocol',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>hasClassSide [
	^false
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>initializeFrom: anotherClassTrait [
	self traitComposition: self traitComposition copyTraitExpression.
	self methodDict: self methodDict copy.
	self localSelectors: self localSelectors copy.
	self basicOrganization: self organization copy.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>initializeWithBaseTrait: aTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	self baseTrait: aTrait.
	self noteNewBaseTraitCompositionApplied: aTrait traitComposition.
	aTrait traitUsers do: [:each | self addUser: each classSide].
	
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>instanceVariableNames: instVarString [
	"Compatibility purposes"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isAnonymous [
	^self soleInstance isAnonymous 
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isBaseTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	^false
]

{
	#category : #'accessing parallel hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isClassTrait [

	<localClassTraitMethod> 
    "This method is supposed to be local in ClassTrait because of a good reason.
    We use this pragma to test if ClassTrait does not contain some accidental 
    local selectors."

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isMeta [
	^ true
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isMetaclassOfClassOrNil [
	
	
	^ self theNonMetaClass 
		ifNil: [ true ] 
		ifNotNil: [ :nonMetaClass | nonMetaClass == Class ] 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isObsolete [
	"Return true if the receiver is obsolete"
	^self soleInstance == nil "Either no thisClass"
		or:[self soleInstance classSide ~~ self "or I am not the class of thisClass"
			or:[self soleInstance isObsolete]] "or my instance is obsolete"
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isSelfEvaluating [
	^self isObsolete not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>isUsed [
	"Metaclasses are used by default"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>name [
	^self baseTrait name , ' classTrait'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>new [
	self error: 'Traits have no instances'
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>noteNewBaseTraitCompositionApplied: aTraitComposition [
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
ClassTrait>>obsoleteSubclasses [
	"Answer the receiver's subclasses."

	self isMetaclassOfClassOrNil ifTrue: [ ^ #() ].

	^ self theNonMetaClass obsoleteSubclasses collect: [ :aSubclass | aSubclass theMetaClass ]
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>possibleVariablesFor: misspelled continuedFrom: oldResults [

	^ self theNonMetaClass possibleVariablesFor: misspelled continuedFrom: oldResults

]

{
	#category : #'instance variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>removeInstVarNamed: aString  [
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
ClassTrait>>removeSubclass: aClass [
	"Do nothing."
]

{
	#category : #'pool variables',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>sharedPools [
	^OrderedCollection new.
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>slots: slotDefinition  [
	"Compatibility purposes"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>soleInstance [
	^baseTrait
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>subclasses [
	"Answer the receiver's subclasses."
	
	self isMetaclassOfClassOrNil ifTrue: [ ^ #() ].
	
	^ self theNonMetaClass subclasses collect: [ :aSubclass | aSubclass theMetaClass ].
]

{
	#category : #'class hierarchy',
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>subclassesDo: aBlock [
	"Evaluate aBlock for each of the receiver's immediate subclasses."
	
	self isMetaclassOfClassOrNil ifTrue: [ ^ self ].
	
	self theNonMetaClass subclasses do: [ :each | aBlock value: each theMetaClass ]
]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>uses: aTraitCompositionOrArray [
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
ClassTrait>>uses: aTraitCompositionOrArray instanceVariableNames: instVarString  [
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
ClassTrait>>uses: aTraitCompositionOrArray slots: slotArray  [
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
ClassTrait>>wantsChangeSetLogging [
	"Answer whether code submitted for the receiver should be remembered by the changeSet mechanism.The metaclass follows the rule of the class itself."

	^ self theNonMetaClass wantsChangeSetLogging
]

{
	#category : #compiling,
	#timestamp : ' 8/31/2017 07:16:25'
}
ClassTrait>>wantsRecompilationProgressReported [
	"The metaclass follows the rule of the class itself."

	^ self theNonMetaClass wantsRecompilationProgressReported
]
