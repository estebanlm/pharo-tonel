"

"
Class {
	#name : #SlotAnnouncementsTest,
	#superclass : #SlotClassBuilderTest,
	#instVars : [
		'announcement',
		'collectedAnnouncements'
	],
	#category : #Slot-Tests,
	#timestamp : ''
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>collectedAnnouncementClasses [
	^ collectedAnnouncements collect: #class
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>collectedAnnouncements [
	^ collectedAnnouncements
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>setUp [
	super setUp.
	
	collectedAnnouncements := OrderedCollection new.
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>subscribeOn: anAnnouncement [

	SystemAnnouncer uniqueInstance weak 
		when: anAnnouncement
		send: #add: 
		to: collectedAnnouncements
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>tearDown  [
	super tearDown.
	
	SystemAnnouncer uniqueInstance unsubscribe: collectedAnnouncements.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testChangeInSharedPoolShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.
	
	"Create a class"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName ].

	self assert: self collectedAnnouncements size equals: 0.
	
	"Modify the class"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			sharedPools: 'TestSharedPool' ].

	self assert: self collectedAnnouncements size equals: 1.
	self assert: self collectedAnnouncements first newClassDefinition equals: aClass.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testChangeInSharedVariablesAndSharedPoolsShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.
	
	"Create a class"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName ].

	self assert: self collectedAnnouncements size equals: 0.
	
	"Modify the class"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			sharedPools: 'TestSharedPool';
			sharedVariablesFromString: 'A B' ].

	self assert: self collectedAnnouncements size equals: 1.
	self assert: self collectedAnnouncements first newClassDefinition equals: aClass.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testChangeInSharedVariablesShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.
	
	"Create a class"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName ].

	self assert: self collectedAnnouncements size equals: 0.
	
	"Modify the class"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			sharedVariablesFromString: 'A B C' ].

	self assert: self collectedAnnouncements size equals: 1.
	self assert: self collectedAnnouncements first newClassDefinition equals: aClass.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testChangeInSuperclassShouldNotAnnounceSubclassModified [

	self subscribeOn: ClassModifiedClassDefinition.
	
	"Create a class and a subclass"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			slots: #() ].

	anotherClass := self make: [ :builder | 
		builder 
			name: self anotherClassName;
			superclass: aClass ].

	self assert: self collectedAnnouncements size equals: 0.
	
	"Modify the superclass"
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			slots: #(a b c) ].

	self assert: self collectedAnnouncements size equals: 1.
	self assert: self collectedAnnouncements first newClassDefinition equals: aClass.
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testClassAddedToNewCategoryShouldAnnounceCategoryAdded [

	self subscribeOn: CategoryAdded.	

	self deny: (self class environment organization includesCategory: self aCategory).
	
	Object 
		subclass: self aClassName
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: (self class environment organization includesCategory: self aCategory).

	self assert: self collectedAnnouncements size equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testClassCreationShouldAnnounceClassAdded [

	self subscribeOn: ClassAdded.
	
	"Create a class"
	aClass := self makeWithLayout: FixedLayout.
	
	self assert: self collectedAnnouncements size equals: 1. 
	self assert: self collectedAnnouncements first classAdded equals: aClass.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testClassRecategorizationShouldAnnounceClassModified [

	self subscribeOn: ClassRecategorized.
	
	aClass := self make: [ :builder|
		builder category: self aCategory ].	
	anotherClass := self make: [ :builder|
		builder category: self anotherCategory ].
	
	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.	
	self assert: announcement oldCategory equals: self aCategory.
	self assert: announcement newCategory equals: self anotherCategory.
	self assert: announcement classRecategorized == anotherClass.
]

{
	#category : #tests-comments,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testCreateAndChangeWithCommentDoesAnnounceBoth [

	| classCommented |
	self subscribeOn: ClassCommented.
	
	aClass := self make: [ :builder |
		builder 
			name: self aClassName;
			comment: 'A class Comment' ].
	
	aClass := self make: [ :builder | 
		builder 
			name: self aClassName;
			comment: 'Another class Comment' ].

	self assert: self collectedAnnouncements size equals: 2.
	
	classCommented := self collectedAnnouncements first.
	self assert: classCommented classCommented equals: aClass.
	self assert: classCommented oldComment equals: ''.
	self assert: classCommented newComment equals: 'A class Comment'.
	self assert: classCommented oldStamp equals: nil. "why nil?" 
	self assert: classCommented newStamp equals: nil. "why nil?"
	
	classCommented := self collectedAnnouncements second.
	self assert: classCommented classCommented equals: aClass.
	self assert: classCommented oldComment equals: 'A class Comment'.
	self assert: classCommented newComment equals: 'Another class Comment'.
	self assert: classCommented oldStamp equals: nil. "why nil?" 
	self assert: classCommented newStamp equals: nil. "why nil?"
]

{
	#category : #tests-comments,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testCreateAndChangeWithoutCommentDoesNotAnnounce [

	self subscribeOn: ClassCommented.
	
	self make: [ :builder |
		builder 
			name: self aClassName ].
	
	self make: [ :builder | 
		builder 
			name: self aClassName;
			sharedPools: 'TestSharedPool' ].

	self assert: self collectedAnnouncements isEmpty.
]

{
	#category : #tests-comments,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testCreateWithCommentDoesAnnounce [

	| classCommented |
	self subscribeOn: ClassCommented.
	
	aClass := self make: [ :builder |
		builder 
			name: self aClassName;
			comment: 'A class Comment' ].
	
	self assert: self collectedAnnouncements size equals: 1.
	
	classCommented := self collectedAnnouncements anyOne.
	
	self assert: classCommented classCommented equals: aClass.
	self assert: classCommented oldComment equals: ''.
	self assert: classCommented newComment equals: 'A class Comment'.
	self assert: classCommented oldStamp equals: nil. "why nil?" 
	self assert: classCommented newStamp equals: nil. "why nil?"
]

{
	#category : #tests-comments,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testEmptyCommentDoesNotAnnounce [

	self subscribeOn: ClassCommented.
	
	self make: [ :builder |
		builder 
			name: self aClassName;
			comment: '' ].

	self make: [ :builder |
		builder 
			name: self aClassName;
			comment: '';
			sharedPools: 'TestSharedPool' ].

	self assert: self collectedAnnouncements isEmpty.
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testFixedClassWhenTraitCompositionChangedShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class without trait composition"
	Object 
		subclass: self aClassName
		uses: { } 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	
	"Set a new trait composition"
	Object 
		subclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.
	
	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.
	self assert: (announcement oldClassDefinition traitComposition syntacticallyEquals: {} asTraitComposition).	
	self assert: (announcement newClassDefinition traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testFixedClassWithTraitCreatedShouldntAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class with a trait composition"
	aClass := Object 
		subclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	self deny: aClass classLayout isVariable.
	self assert: (aClass traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testLayoutChangeShouldAnnounceClassModified [

	| classAdded classModified |
	self subscribeOn: ClassModifiedClassDefinition.
	
	"Create a class"
	classAdded := self makeWithLayout: FixedLayout.
	
	"Modify its format"
	classModified := self makeWithLayout: WeakLayout.

	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.
	self assert: announcement newClassDefinition equals: classModified.
	self assert: announcement oldClassDefinition format equals: classAdded format.
	self assert: announcement newClassDefinition format equals: classModified format.
]

{
	#category : #tests-comments,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testSameCommentDoesNotAnnounce [

	self subscribeOn: ClassCommented.
	
	self make: [ :builder |
		builder 
			name: self aClassName;
			comment: 'A class Comment' ].

	self make: [ :builder |
		builder 
			name: self aClassName;
			comment: 'A class Comment' ].
	
	self assert: self collectedAnnouncements size equals: 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testSlotAdditionShouldAnnounceClassModified [

	| classAdded classModified |
	self subscribeOn: ClassModifiedClassDefinition.
	
	"Create a class"
	classAdded := self makeWithLayout: FixedLayout.
	
	"now we extend it with slots.  The class definition should've changed"
	classModified := self makeWithLayout: FixedLayout andSlots: { #aSlot }.

	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.	
	self assert: announcement newClassDefinition equals: classModified.
	self assert: announcement oldClassDefinition allInstVarNames equals: classAdded allInstVarNames.
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testVariableByteClassWhenTraitCompositionChangedShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class without trait composition"
	Object 
		variableByteSubclass: self aClassName
		uses: { } 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	
	"Set a new trait composition"
	Object 
		variableByteSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.
	
	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.
	self assert: (announcement oldClassDefinition traitComposition syntacticallyEquals: {} asTraitComposition).	
	self assert: (announcement newClassDefinition traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testVariableByteClassWithTraitCreatedShouldntAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class with a trait composition"
	aClass := Object 
		variableByteSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	self assert: aClass classLayout isVariable.
	self assert: aClass classLayout isBits.
	self assert: aClass classLayout isBytes.
	self assert: (aClass traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testVariableClassWhenTraitCompositionChangedShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class without trait composition"
	Object 
		variableSubclass: self aClassName
		uses: { } 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	
	"Set a new trait composition"
	Object 
		variableSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.
	
	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.
	self assert: (announcement oldClassDefinition traitComposition syntacticallyEquals: {} asTraitComposition).	
	self assert: (announcement newClassDefinition traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testVariableClassWithTraitCreatedShouldntAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class with a trait composition"
	aClass := Object 
		variableSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	self assert: aClass classLayout isVariable.
	self deny: aClass classLayout isBits .
	self assert: (aClass traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testVariableWordClassWhenTraitCompositionChangedShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class without trait composition"
	Object 
		variableWordSubclass: self aClassName
		uses: { } 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		package: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	
	"Set a new trait composition"
	Object 
		variableWordSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		package: self aCategory.
	
	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.
	self assert: (announcement oldClassDefinition traitComposition syntacticallyEquals: {} asTraitComposition).	
	self assert: (announcement newClassDefinition traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testVariableWordClassWithTraitCreatedShouldntAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class with a trait composition"
	aClass := Object 
		variableWordSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		package: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	self assert: aClass classLayout isVariable.
	self assert: aClass classLayout isBits.
	self assert: aClass classLayout isWords.
	self assert: (aClass traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testWeakClassWhenTraitCompositionChangedShouldAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class without trait composition"
	Object 
		weakSubclass: self aClassName
		uses: { } 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	
	"Set a new trait composition"
	Object 
		weakSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.
	
	self assert: self collectedAnnouncements size equals: 1.
	announcement := self collectedAnnouncements first.
	self assert: (announcement oldClassDefinition traitComposition syntacticallyEquals: {} asTraitComposition).	
	self assert: (announcement newClassDefinition traitComposition syntacticallyEquals: TOne asTraitComposition).
]

{
	#category : #tests-integration,
	#timestamp : ' 8/31/2017 05:26:46'
}
SlotAnnouncementsTest>>testWeakClassWithTraitCreatedShouldntAnnounceClassModified [

	self subscribeOn: ClassModifiedClassDefinition.	

	"Create a class with a trait composition"
	aClass := Object 
		weakSubclass: self aClassName
		uses: TOne 
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: self aCategory.

	self assert: self collectedAnnouncements size isZero.
	self assert: aClass classLayout isVariable.
	self assert: aClass classLayout isWeak.
	self assert: (aClass traitComposition syntacticallyEquals: TOne asTraitComposition).
]
