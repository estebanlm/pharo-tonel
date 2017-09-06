"
SUnit tests for the class hierarchy
"
Class {
	#name : #ClassHierarchyTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Classes,
	#timestamp : 'TorstenBergmann 2/5/2014 08:31'
}

{
	#category : #fixing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassHierarchyTest class>>fixSlotScope [
	"postscript for issue 11596"
	
	| ivName all candidates toRebuild |
    ivName := 'anIVNameImPrettySureNobodyUses'.
    all := Smalltalk allClasses flatCollect: [ :e | { e . e class } ].
    candidates := all reject: [ :e | e superclass isNil or: [e classLayout slotScope isKindOf: LayoutEmptyScope ] ].
    toRebuild := candidates reject: [ :e | e superclass classLayout slotScope == e classLayout slotScope parentScope ].
    toRebuild sort: [ :a :b | a allSuperclasses size > b allSuperclasses size ].
    toRebuild do: [ :e | 
    e addInstVarNamed: ivName.
        (e isClassSide
          ifTrue: [ (Smalltalk at: e instanceSide name) classSide ]
          ifFalse: [ Smalltalk at: e name ]) removeInstVarNamed: ivName ]
]

{
	#category : #fixing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassHierarchyTest class>>fixSubclasses [
	"Fix all the missing subclasses"
	"ClassHierarchyTest fixSubclasses "
	SystemNavigation new allClassesDo: [ :cls|
		(cls superclass subclasses includes: cls)
			ifFalse: [ cls superclass addSubclass: cls ]]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassHierarchyTest>>testObjectFormatInstSize [
	| classes |
	"check that #instSize is in sync with #allInstVarNames"
	self assert:
			(SystemNavigation default allBehaviors
				allSatisfy: [ :cls | cls instSize = cls allInstVarNames size ]).

	"instSpec is only 0 for classes without any inst vars or variable fields"
	classes := SystemNavigation default allBehaviors
		select: [ :cls | cls isTrait not and: [ cls instSpec = 0 ] ].
	self assert: (classes allSatisfy: [ :each | each instVarNames isEmpty or: [ each isVariable not ] ])
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassHierarchyTest>>testSubclassInstVar [
	| subclasses |
	SystemNavigation new allClassesDo: [ :cls|
		subclasses := cls subclasses.
		self assert: subclasses isNil not.
		subclasses do: [:subclass|
			self assert: (subclasses occurrencesOf: subclass) = 1.
			self assert: subclass superclass == cls.
			"cls removeSubclass: subclass.
			cls addSubclass: subclass."]]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassHierarchyTest>>testSubclasses [
	" self class fixSubclasses "

	SystemNavigation new
		allClassesDo: [ :cls | 
			self
				assert: (cls superclass subclasses includes: cls)
				description: cls name , ' is not in ' , (cls superclass ifNotNil: [ :superclass | superclass name ] ifNil: [ 'nil' ]) , '''s subclasses' ]
]
