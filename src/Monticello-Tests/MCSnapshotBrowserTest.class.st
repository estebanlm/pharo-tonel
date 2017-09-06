"

"
Class {
	#name : #MCSnapshotBrowserTest,
	#superclass : #MCTestCase,
	#instVars : [
		'model',
		'morph'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>allCategories [
	^ Array with: model extensionsCategory with: self mockCategoryName.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>allMethods [
	^ MCSnapshotResource current definitions
		select: [:def | def isMethodDefinition]
		thenCollect: [:def | def selector]		
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>allProtocols [
	^ MCSnapshotResource current definitions
		select: [:def | def isMethodDefinition]
		thenCollect: [:def | def category]		
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>annotationTextMorph [
	^ (self morphsOfClass: TextMorph) first
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>assertAListIncludes: anArrayOfStrings [
	self listMorphs 
			detect: [:m | m getList includesAll: anArrayOfStrings]
			ifNone: [self assert: false].
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>assertAListMatches: strings [
	| lists |
	lists := self listMorphs collect: #getList.
	lists
		detect: [ :list|
			(list size = strings size) and: [list includesAll: strings]]
		ifNone: [ 
			self fail: 'Could not find all "', strings asArray asString, '" ', 
						'in any of "', (lists collect: #asArray) asArray asString, '"'  ].
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>assertButtonExists: aString [
	self buttonMorphs detect: [:m | m label = aString] ifNone: [self assert: false].
				
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>assertButtonOn: aString [
	self assert: (self findButtonWithLabel: aString) getModelState.
	
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>assertTextIs: aString [
	self assert: self textMorph text = aString.
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>buttonMorphs [
	^ self morphsOfClass: PluggableButtonMorph
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>classABooleanMethods [
	^ #(falsehood moreTruth truth)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>classAClassProtocols [
	^ self protocolsForClass: self mockClassA class.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>classAComment [
	^ self mockClassA organization classComment.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>classADefinitionString [
	^ self mockClassA definition
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>classAProtocols [
	^ self protocolsForClass: self mockClassA.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>classAclassDefinitionString [
	^ self mockClassA class definition
]

{
	#category : #simulating,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>clickOnButton: aString [
	(self findButtonWithLabel: aString) performAction.
]

{
	#category : #simulating,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>clickOnListItem: aString [
	| listMorph |
	listMorph := self findListContaining: aString.
	listMorph changeModelSelection: (listMorph getList indexOf: aString).
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>definedClasses [
	^ MCSnapshotResource current definitions 
		select: [:def | def isClassDefinition] 
		thenCollect: [:def | def className].
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>denyAListHasSelection: aString [
	| found |
	found := true.
	self listMorphs 
			detect: [:m | m selection = aString]
			ifNone: [found := false].
	self deny: found.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>denyAListIncludesAnyOf: anArrayOfStrings [
	| found |
	found := true.
	self listMorphs 
			detect: [:m | m getList includesAnyOf: anArrayOfStrings]
			ifNone: [found := false].
	self deny: found.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>denyButtonOn: aString [
	self deny: (self findButtonWithLabel: aString) getModelState.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>falsehoodMethodSource [
	^ 'falsehood
	^ false'
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>findButtonWithLabel: aString [
	^ self buttonMorphs detect: [:m | m label = aString]
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>findListContaining: aString [
	^ self listMorphs detect: [:m | m getList includes: aString]
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>listMorphs [
	^ self morphsOfClass: PluggableListMorph
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>morphsOfClass: aMorphClass [
	| morphs |
	morphs := OrderedCollection new.
	morph allMorphsDo: [:m | (m isKindOf: aMorphClass) ifTrue: [morphs add: m]].
	^ morphs
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>protocolsForClass: aClass [
	^ aClass organization allCategories

]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>selectMockClassA [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>setUp [
	model := MCSnapshotBrowser forSnapshot: MCSnapshotResource current snapshot.
	morph := model buildWindow.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testButtonMutex [
	self assertButtonOn: 'instance'.
	self denyButtonOn: '?'.
	self denyButtonOn: 'class'.
	
	self clickOnButton: '?'.
	self assertButtonOn: '?'.
	self denyButtonOn: 'instance'.
	self denyButtonOn: 'class'.
	
	self clickOnButton: 'class'.
	self assertButtonOn: 'class'.
	self denyButtonOn: '?'.
	self denyButtonOn: 'instance'.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testCategorySelected [
	self clickOnListItem: self mockCategoryName.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self denyAListIncludesAnyOf: self allProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	self assertTextIs: ''.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testClassSelected [
	self selectMockClassA.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	self assertTextIs: self classADefinitionString.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testClassSideClassSelected [
	self clickOnButton: 'class'.
	self selectMockClassA.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAClassProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	self assertTextIs: self classAclassDefinitionString.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testComment [
	self clickOnButton: '?'.
	self assertTextIs: ''.
	
	self clickOnListItem: self mockCategoryName.
	self assertTextIs: ''.
	
	self clickOnListItem: 'MCMockClassA'.
	self assertTextIs: self classAComment.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testFourColumns [
	self assert: self listMorphs size = 4.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testMethodIsCleared [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	self clickOnListItem: 'boolean'.
	self clickOnListItem: 'falsehood'.
	self clickOnListItem: AllProtocol defaultName.
	
	self denyAListHasSelection: 'falsehood'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testMethodSelected [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	self clickOnListItem: 'boolean'.
	self clickOnListItem: 'falsehood'.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAProtocols.
	self assertAListMatches: self classABooleanMethods.
	self assertTextIs: self falsehoodMethodSource.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testNoSelection [
	self assertAListMatches: self allCategories.
	self denyAListIncludesAnyOf: self definedClasses.
	self denyAListIncludesAnyOf: self allProtocols.
	self denyAListIncludesAnyOf: self allMethods.
	"and if there I need to see the packages scripts (or none)"
	self assertTextIs: '(package defines no scripts)'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testProtocolIsCleared [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockASubclass'.
	self clickOnListItem: 'as yet unclassified'.
	self clickOnListItem: 'MCMockClassA'.
	
	self denyAListHasSelection: 'as yet unclassified'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testProtocolSelected [
	self clickOnListItem: self mockCategoryName.
	self clickOnListItem: 'MCMockClassA'.
	self clickOnListItem: 'boolean'.
	
	self assertAListMatches: self allCategories.
	self assertAListMatches: self definedClasses.
	self assertAListMatches: self classAProtocols.
	self assertAListMatches: self classABooleanMethods.
	self assertTextIs: ''.		
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testTextPane [
	self textMorph
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>testThreeButtons [
	self assertButtonExists: 'instance'.
	self assertButtonExists: '?'.
	self assertButtonExists: 'class'.
]

{
	#category : #morphic,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCSnapshotBrowserTest>>textMorph [
	^ (self morphsOfClass: RubPluggableTextMorph) last
]
