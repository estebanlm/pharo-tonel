"
I'm useful when classes needs to be created during the execution of the test. This avoid polluting your unit tests with dummy and mock classes.
A typical usage of it is:

TestCase subclass: #YourTest
       instanceVariableNames: 'classFactory'

YourTest>>setUp
       classFactory := ClassFactoryForTestCase new

YourTest>>tearDown
       classFactory deleteClasses.

YourTest>>testIsBehavior
       | cls |
       cls := classFactory newClass.
       self assert: cls isBehavior

"
Class {
	#name : #ClassFactoryForTestCase,
	#superclass : #Object,
	#instVars : [
		'createdClasses',
		'createdTraits',
		'createdSilently'
	],
	#classVars : [
		'Counter'
	],
	#category : #SUnit-Core-Extensions,
	#timestamp : 'LaurentLaffont 4/15/2011 20:20'
}

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>cleanUp [
	| createdClassNames createdTraitNames |
	createdClassNames := self createdClassNames.
	createdTraitNames := self createdTraitNames.
	self deleteClasses.
	self deleteTraits.
	self deletePackage.
	self cleanUpChangeSetForClassNames: createdClassNames.
	self cleanUpChangeSetForClassNames: createdTraitNames
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>cleanUpChangeSetForClassNames: classeNames [

	self class environment at: #ChangeSet ifPresent: [ :aChangeSetClass |
		| changeSet |
		changeSet := aChangeSetClass current.
		classeNames do: [:name|	
			changeSet 
				removeClassChanges: name;
				removeClassChanges: name, ' class'] ]..	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>createdClassNames [
	^self createdClasses collect: [:class| class name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>createdClasses [
	^createdClasses
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>createdTraitNames [
	^self createdTraits collect: [:trait | trait name]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>createdTraits [
	^createdTraits
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>defaultCategory [
	^ (self packageName , '-', self defaultCategoryPostfix) asSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>defaultCategoryPostfix [
	^ #Default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>defaultSuperclass  [
	^Object
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>delete: aBehavior [
	aBehavior isObsolete
		ifTrue: [ ^ self ].
	self class environment at: #ChangeSet ifPresent: [ 
		aBehavior removeFromChanges ].
	(createdSilently includes: aBehavior)
		ifTrue: [ aBehavior removeFromSystemUnlogged ]
		ifFalse: [ aBehavior removeFromSystem ].
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>deleteClass: aClass [
	self createdClasses remove: aClass.
	self delete: aClass.
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>deleteClasses [
	self createdClasses do: [:class|
		self delete: class]
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>deletePackage [
	| categoriesMatchString |
	categoriesMatchString := self packageName, '-*'.
	SystemOrganization removeCategoriesMatching: categoriesMatchString
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>deleteTraits [
	self createdTraits do: [:trait|
		self delete: trait]
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>duplicateClass: aClass withNewName: name [
	| newClass |
	
	newClass := aClass duplicateClassWithNewName: name.
	self createdClasses add: newClass.
	^newClass

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>initialize [
	super initialize.
	createdClasses := IdentitySet new.
	createdTraits := IdentitySet new.
	createdSilently := IdentitySet new.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newClass [
	^ self 
		newSubclassOf: self defaultSuperclass
		instanceVariableNames: ''
		classVariableNames: ''
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newClassInCategory: category [
	^ self
		newSubclassOf: self defaultSuperclass
		instanceVariableNames: ''
		classVariableNames: ''
		category: category
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newClassName [
	| postFix |
	postFix := self nextCount printString.
	^(#ClassForTestToBeDeleted, postFix) asSymbol.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newClassUsing: aTraitComposition [
	^self 
		newSubclassOf: self defaultSuperclass 
		uses: aTraitComposition 
		instanceVariableNames: '' 
		classVariableNames: ''
		category: self defaultCategoryPostfix.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString  [
	^self 
		newSubclassOf: aClass 
		uses: { }
		instanceVariableNames: ivNamesString 
		classVariableNames: classVarsString 
		category: self defaultCategoryPostfix
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString category: category [
	^self 
		newSubclassOf: aClass 
		uses: { } 
		instanceVariableNames: ivNamesString 
		classVariableNames: classVarsString 
		category: category.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames:  classVarsString category: category [
	^self
		newSubclassOf: aClass 
		uses: aTraitComposition
		instanceVariableNames: ivNamesString 
		classVariableNames: classVarsString 
		poolDictionaries: '' 
		category: category
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newSubclassOf: aClass uses: aTraitComposition instanceVariableNames: ivNamesString classVariableNames:  classVarsString poolDictionaries: poolNamesString category: category [
	| newClass |
	newClass := aClass 
		subclass: self newClassName 
		uses: aTraitComposition
		instanceVariableNames: ivNamesString 
		classVariableNames: classVarsString 
		poolDictionaries: poolNamesString 
		category: (self packageName, '-', category) asSymbol.
	self createdClasses add: newClass.
	^newClass
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newSubclassOf: aClass using: aTraitComposition [
	^self 
		newSubclassOf: aClass
		uses: aTraitComposition 
		instanceVariableNames: '' 
		classVariableNames: ''
		category: self defaultCategoryPostfix.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newTrait [
	^ self
		newTraitNamed: self newTraitName
		uses: Array new
		category: self defaultCategoryPostfix
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newTraitInCategory: category [
	^ self
		newTraitNamed: self newTraitName
		uses: Array new
		category: category asSymbol.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newTraitName [
	| postFix |
	postFix := (self createdTraits size + 1) printString.
	^(#TraitForTestToBeDeleted, postFix) asSymbol
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newTraitNamed: aTraitName uses: aTraitComposition category: aCategory [
	| newTrait |
	
	newTrait := Trait 
					named: aTraitName
					uses: aTraitComposition 
					category: (self packageName, '-', aCategory) asSymbol..
		
	self createdTraits add: newTrait.
	
	^newTrait.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>newTraitUsing: aTraitComposition. [
	^self 
		newTraitNamed: self newTraitName 
		uses: aTraitComposition 
		category: self defaultCategoryPostfix.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>nextCount [
	"Global counter to avoid name clash between test runs, in case of some previous failure."
	^Counter := (Counter ifNil: [ 0 ]) + 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>packageName [
	^#CategoryForTestToBeDeleted
]

{
	#category : #'creating - silently',
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>silentlyNewClassInCategory: category [
	^ self
		silentlyNewSubclassOf: self defaultSuperclass
		instanceVariableNames: ''
		classVariableNames: ''
		category: category
]

{
	#category : #'creating - silently',
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>silentlyNewSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames: classVarsString [
	^ self
		silentlyNewSubclassOf: aClass
		instanceVariableNames: ivNamesString
		classVariableNames: classVarsString
		category: self defaultCategoryPostfix
]

{
	#category : #'creating - silently',
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>silentlyNewSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString category: category [

	|  newClass |
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		newClass := aClass 
			subclass: self newClassName 
			instanceVariableNames: ivNamesString 
			classVariableNames: classVarsString 
			poolDictionaries: '' 
			category: (self packageName, '-', category) asSymbol.
	].

	self createdClasses add: newClass.
	createdSilently add: newClass.
	^newClass
	
]

{
	#category : #'creating - silently',
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>silentlyNewSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString package: packageName [

	|  newClass |
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		newClass := aClass 
			subclass: self newClassName 
			instanceVariableNames: ivNamesString 
			classVariableNames: classVarsString 
			poolDictionaries: '' 
			category: packageName asSymbol.
	].

	self createdClasses add: newClass.
	createdSilently add: newClass.
	^newClass
	
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>withNotificationsNewClass [
	^  self withNotificationsNewClassWithInstanceVariableNames: ''
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryForTestCase>>withNotificationsNewClassWithInstanceVariableNames: instanceVariableNames [
	^ self
		newSubclassOf: Object
		instanceVariableNames: instanceVariableNames
		classVariableNames: ''
		category: self defaultCategoryPostfix
]
