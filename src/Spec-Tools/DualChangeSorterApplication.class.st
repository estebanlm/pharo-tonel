"
A DualChangeSorterApplication is a dual change sorter based on spec.

DualChangeSorter shares the model between its two subcomponents (ChangeSorterApplication).
ChangeSorterModel defines the application logic.

"
Class {
	#name : #DualChangeSorterApplication,
	#superclass : #ComposableModel,
	#instVars : [
		'model',
		'changeSorterLeft',
		'changeSorterRight',
		'isRefreshing'
	],
	#category : #Spec-Tools-ChangeSorter,
	#timestamp : '<historical>'
}

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>changesListMenu: aBuilder [
	<contextMenu>
	<dualChangeSorteChangesListMenu>
	
	| target src dest |

	self flag: #todo. "I do not like how I'm getting the parameters (an Array), but looks the faster way now :(
	And I need src and dest parameters because it is called in two sides of change sorter"
	target := aBuilder model first.
	src := aBuilder model second.
	dest := aBuilder model third. 
	
	src selectedChangeSet ifNil:[ ^self ].
	
	(aBuilder item: #'Copy all to the other change set')
		keyText: 'c';
		action: [ target copyAllFrom: src to: dest ].
	(aBuilder item: #'Submerge into the other change set')
		action: [ target submerge: src into: dest ].
	(aBuilder item: #'Subtract the other change set')
		keyText: '-';
		action: [ target subtractFrom: src to: dest ];
		withSeparatorAfter.
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>classListMenu: aBuilder [
	<contextMenu>
	<dualChangeSorterClassListMenu>
	
	| target src dest |
	
	self flag: #todo. "I do not like how I'm getting the parameters (an Array), but looks the faster way now :(
	And I need src and dest parameters because it is called in two sides of change sorter"
	target := aBuilder model first.
	src := aBuilder model second.
	dest := aBuilder model third. 
	
	(aBuilder item: #'Copy class to the other change set')
		keyText: 'c';
		action: [ target copyClassFrom: src to: dest ].
	(aBuilder item: #'Move class to the other change set')
		action: [ target moveClassFrom: src to: dest ].

]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>defaultSpec [
	<spec>
	
	^ SpecLayout composed
			newRow: [:r |
					r 
						add: #changeSorterLeft;
						addSplitter;
						add: #changeSorterRight ]
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>menuCommandOn: aBuilder  [
	<worldMenu> 
	(aBuilder group: #SystemChanges)
		parent: #Tools;  
		order: 0.51;
		with: [
			(aBuilder item: #'Change Sorter')
				action:[self open]; 
				icon: self taskbarIcon].			
	aBuilder withSeparatorAfter.		
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>messageListMenu: aBuilder [
	<contextMenu>
	<dualChangeSorterMessageListMenu>
	
	| target src dest |
	
	self flag: #todo. "I do not like how I'm getting the parameters (an Array), but looks the faster way now :(
	And I need src and dest parameters because it is called in two sides of change sorter"
	target := aBuilder model first.
	src := aBuilder model second.
	dest := aBuilder model third. 
	
	(aBuilder item: #'Copy method to the other change set')
		action: [ target copyMethodFrom: src to: dest ].
	(aBuilder item: #'Move method to the other change set')
		action: [ target moveMethodFrom: src to: dest ];
		withSeparatorAfter.

]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>open [
	self new openWithSpec
]

{
	#category : #tools-registry,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>registerToolsOn: registry [

	"Add ourselves to registry. See [Smalltalk tools]" 
	registry register: self as: #changeSorter
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>taskbarIconName [
	^ #changeSorterIcon
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication class>>title [

	^'Dual Change Sorter'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>changeSorterLeft [

	^ changeSorterLeft
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>changeSorterRight [

	^ changeSorterRight
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>changesMenu: menu shifted: shifted from: sourcePanel to: destinationPanel [
	| menuModel menuDest |

	menuModel := MenuModel new.
	menu addTitle: 'Change Set'.
	sourcePanel changeSetMenu1: menu shifted: shifted.
	menuDest := MenuModel new
		fromSpec:
			(PragmaMenuBuilder
				pragmaKeyword: 'dualChangeSorteChangesListMenu'
				model:
					{self.
					sourcePanel.
					destinationPanel}) menuSpec.
	menuDest menuGroups do: [ :each | menuModel addMenuGroup: each ].
	menu addAllMorphs: (menuModel buildWithSpec: #popup) items.
	sourcePanel changeSetMenu2: menu shifted: shifted.
	^ menu
]

{
	#category : #'menu - change set',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>checkThatSidesDiffer: escapeBlock [
	"If the change sets on both sides of the dual sorter are the same, put up an error message and escape via escapeBlock, else proceed happily"

	changeSorterLeft selectedChangeSet == changeSorterRight selectedChangeSet
		ifFalse: [ ^ self ].
	self
		inform:
			'This command requires that the
change sets selected on the two
sides of the change sorter *not*
be the same.'.
	^ escapeBlock value
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>classMenu: menu shifted: shifted from: sourcePanel to: destinationPanel [
	"Fill aMenu with items appropriate for the class list"
	| menuModel menuDest |
	
	menuModel := MenuModel new.
	sourcePanel selectedClass ifNil: [ ^ nil ].
	sourcePanel classMenu: menu shifted: shifted.
	menuDest := MenuModel new fromSpec: (PragmaMenuBuilder
		pragmaKeyword: 'dualChangeSorterClassListMenu'
		model: {self. sourcePanel. destinationPanel}) 
		menuSpec.
	menuDest menuGroups do: [ :each | menuModel addMenuGroup: each ].
	menu addAllMorphs: (menuModel buildWithSpec: #popup) items.
	^ menu
]

{
	#category : #'menu - change set',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>copyAllFrom: src to: dest [

	self checkThatSidesDiffer: [ ^ self ].
	self model copyAllChangesFrom: (src selectedChangeSet) to: (dest selectedChangeSet).
	dest updateClassesList.
]

{
	#category : #'menu - class',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>copyClassFrom: src to: dest [
	"Place these changes in the other changeSet also"

	| otherChangeSet |
	self checkThatSidesDiffer: [ ^ self ].
	self okToChange ifFalse: [ ^ self inform: 'Can''t discard edits.' ].
	src selectedClass ifNil: [ ^ self inform: 'Selected class is nil.' ].
	otherChangeSet := dest selectedChangeSet.
	
	self model copyClass: src selectedClass from: src selectedChangeSet to: otherChangeSet.
	
	dest setSelectedChangeSet: otherChangeSet.
]

{
	#category : #'menu - method',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>copyMethodFrom: src to: dest [
	"Place this change in the other changeSet also"	
	| other |
	
	self checkThatSidesDiffer: [^ self].
	other := dest selectedChangeSet.
	
	src selectedSelector ifNotNil: [:selector || class |
		class := src selectedClass.
		
		self model 
			copySelector: selector 
			inClass: class 
			from: src selectedChangeSet 
			to: other.
			
		dest updateClassesListAndMessagesList ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>initialExtent [

	^  900@530
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>initialize [

	super initialize.
	model := ChangeSorterModel new.
	isRefreshing := false.
	SystemAnnouncer uniqueInstance weak 
		when: CurrentChangeSetChanged 
		send: #updateTitle 
		to: self 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>initializePresenter [

	changeSorterLeft 	whenChangesListChanges: [ self refeshedChangeSet: changeSorterRight ].
	changeSorterRight	whenChangesListChanges: [ self refeshedChangeSet: changeSorterLeft ].


]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>initializeWidgets [

	changeSorterLeft := self instantiate: ChangeSorterApplication.
	changeSorterRight := self instantiate: ChangeSorterApplication.
		
	self menusRegistration.
	self shortcutsRegistration.
	self setFocusOrder
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>menusRegistration [

	self menusRegistrationFrom: changeSorterLeft to: changeSorterRight.
	self menusRegistrationFrom: changeSorterRight to: changeSorterLeft
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>menusRegistrationFrom: src to: dest [
	
	src changesMenu: [:menu :shifted | self changesMenu: menu shifted: shifted from: src to: dest ].
	src classesMenu: [:menu :shifted | self classMenu: menu shifted: shifted from: src to: dest ].
	src methodsMenu: [:menu :shifted | self messageMenu: menu shifted: shifted from: src to: dest ].
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>messageMenu: menu shifted: shifted from: sourcePanel to: destinationPanel [
	"Fill aMenu with items appropriate for the message list; could be for a single or double changeSorter"
	
	| menuModel menuDual |
	
	menuModel := MenuModel new.
	sourcePanel selectedSelector ifNil: [ ^ nil ].
	sourcePanel messageMenu: menu shifted: shifted.
	menuDual := MenuModel new fromSpec: (PragmaMenuBuilder 
		pragmaKeyword: 'dualChangeSorterMessageListMenu'
		model: { self. sourcePanel. destinationPanel }) 
		menuSpec.
	menuDual menuGroups do: [ :each | menuModel addMenuGroup: each ].
	menu addAllMorphs: (menuModel buildWithSpec: #popup) items.
	^ menu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>model [

	^ model
]

{
	#category : #'menu - class',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>moveClassFrom: src to: dest [

	self checkThatSidesDiffer: [^ self].
	(self okToChange and: [ src selectedClass notNil]) ifFalse: [ ^ self ].

	self copyClassFrom: src to: dest.
	src forgetClass
]

{
	#category : #'menu - method',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>moveMethodFrom: src to: dest [

	self copyMethodFrom: src to: dest.
	src forgetMessage.
	src updateClassesListAndMessagesList.
]

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>refeshedChangeSet: changeSet [
	isRefreshing
		ifTrue: [ ^ self ].
	isRefreshing := true.
	changeSet updateChangesList.
	isRefreshing := false
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>setFocusOrder [

	self focusOrder
		add: changeSorterLeft;
		add: changeSorterRight.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>shortcutsRegistration [

	self shortcutsRegistrationFrom: changeSorterLeft to: changeSorterRight.
	self shortcutsRegistrationFrom: changeSorterRight to: changeSorterLeft.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>shortcutsRegistrationFrom: src to: dest [
	
	src changesModelOn: $c meta do: [ self copyAllFrom: src to: dest ].
	src changesModelOn: $- meta do: [ self subtractFrom: src to: dest ]. 
]

{
	#category : #'menu - change set',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>submergeFrom: src into: dest [
	"Copy the contents of the receiver to the other side, then remove the receiver -- all after checking that all is well."
	| source destination index |

	source := src selectedChangeSet.
	destination := dest selectedChangeSet.
	index := src selectedChangeSetIndex.

	(self model submerge: source into: destination) ifFalse: [ ^ self ].
	
	src updateChangesList.
	src setSelectedChangeSetIndex: index.
]

{
	#category : #'menu - change set',
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>subtractFrom: src to: dest [
	"Subtract the changes found on the other side from the requesting side."
	| source destination |
	source := src selectedChangeSet.
	destination := dest selectedChangeSet.
	
	self checkThatSidesDiffer: [^ self].
	
	self model subtractFrom: source to: destination.
	
	changeSorterRight setSelectedChangeSet: source.
]

{
	#category : #event,
	#timestamp : ' 8/31/2017 05:26:19'
}
DualChangeSorterApplication>>title [

	^ super title, ' on: ', self model currentChangeSet name. 
]
