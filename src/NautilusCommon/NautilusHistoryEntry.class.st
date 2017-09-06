"
I am a history entry which hold a single step of the Nautilus browsing history
"
Class {
	#name : #NautilusHistoryEntry,
	#superclass : #Object,
	#instVars : [
		'selectedPackage',
		'selectedCategory',
		'selectedSelector',
		'selectedClass',
		'selectedGroup',
		'showHierarchy',
		'sortHierarchically',
		'showComment',
		'showInstance',
		'showCategories'
	],
	#category : #NautilusCommon,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry class>>with: aNautilus [

	^ self new 
		with: aNautilus;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>= anotherWrapper [
	self species = anotherWrapper species
		ifFalse: [ ^ false ].
	^ self selectedPackage = anotherWrapper selectedPackage
		and:
			[ 
			self selectedGroup = anotherWrapper selectedGroup
				and:
					[ 
					self selectedClass = anotherWrapper selectedClass
						and:
							[ 
							self selectedCategory = anotherWrapper selectedCategory
								and:
									[ 
									self selectedSelector = anotherWrapper selectedSelector
										and:
											[ 
											self showHierarchy = anotherWrapper showHierarchy
												and:
													[ 
													self showInstance = anotherWrapper showInstance
														and:
															[ 
															self sortHierarchically = anotherWrapper sortHierarchically
																and:
																	[  
																	self showComment = anotherWrapper showComment
																		and: [ self showCategories = anotherWrapper showCategories ] ] ] ] ] ] ] ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>applyTo: aNautilus [
	aNautilus ui ifNotNil: [ :interface | interface resetAllListSelections ].
	aNautilus
		selectedPackage: self selectedPackage;
		selectedClass: selectedClass;
		selectedCategory: self selectedCategory.
	aNautilus selectedMethod: self selectedMethod.
	aNautilus browsingHistory
		pauseDuring: [ 
			aNautilus
				selectedGroup: self selectedGroup;
				showHierarchy: self showHierarchy;
				sortHierarchically: self sortHierarchically;
				showComment: self showComment;
				showInstance: self showInstance;
				showCategories: self showCategories ].
	aNautilus ui
		ifNotNil: [ :interface | 
			interface showHierarchy: aNautilus showHierarchy.
			interface showInstance: (selectedClass ifNil: [ false ] ifNotNil: [ selectedClass isMeta not ]).
			interface
				selectedPackageWithoutChangingSelectionInternally: self selectedPackage;
				selectedClassWithoutChangingSelectionInternally: selectedClass;
				selectedCategoryInternally: self selectedCategory.
			interface updatePackageGroupAndClassList.
			interface selectedMethod: self selectedMethod.
			interface updateCategoryAndMethodList ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>asHistoryString [
	| separator |
	separator := ' >>#'.
	^ String
		streamContents:
			[ :s | 
			self selectedPackage
				ifNotNil:
					[ :p | 
					self selectedClass
						ifNotNil:
							[ :c | 
							s << c name.
							self selectedSelector ifNotNil: [ :m | s << separator << m asString ] ] ] ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>hash [
	| hash |
	hash := selectedPackage hash.
	{ selectedCategory . selectedSelector . selectedClass . selectedGroup } do: [ :iv |
		hash := hash bitXor: iv hash ].
	^ hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedCategory [

		^ selectedCategory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedCategory: anObject [
	
		selectedCategory := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedClass [

		^ selectedClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedClass: anObject [
	
		selectedClass := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedGroup [

		^ selectedGroup
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedGroup: anObject [
	
		selectedGroup := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedMethod [
	selectedSelector ifNil: [ ^ nil ].
	^ selectedClass ifNil: [ nil ] ifNotNil: [ selectedClass compiledMethodAt: selectedSelector ifAbsent: [ nil ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedMethod: anObject [
	
		selectedSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedPackage [

		^ selectedPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedPackage: anObject [
	
		selectedPackage := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedSelector [

	^ selectedSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>selectedSelector: anObject [
	
		selectedSelector := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showCategories [

		^ showCategories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showCategories: anObject [
	
		showCategories := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showComment [

		^ showComment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showComment: anObject [
	
		showComment := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showHierarchy [

		^ showHierarchy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showHierarchy: anObject [
	
		showHierarchy:= anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showInstance [

		^ showInstance
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>showInstance: anObject [
	
		showInstance := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>sortHierarchically [

		^ sortHierarchically
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>sortHierarchically: anObject [
	
		sortHierarchically := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
NautilusHistoryEntry>>with: aNautilus [
	
	self 
		selectedPackage: aNautilus selectedPackage;
		selectedCategory: aNautilus selectedCategory.
		aNautilus selectedMethod
			ifNil: [ self selectedSelector: nil ]
			ifNotNil: [:met | self selectedSelector: met selector].
	self
		selectedClass: aNautilus selectedClass;
		selectedGroup: aNautilus selectedGroup;
		showHierarchy: aNautilus showHierarchy;
		sortHierarchically: aNautilus sortHierarchically;
		showComment: aNautilus showComment;
		showInstance: aNautilus showInstance;
		showCategories: aNautilus showCategories.
]
