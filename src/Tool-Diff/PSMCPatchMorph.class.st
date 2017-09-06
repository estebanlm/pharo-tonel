"
I'm a Monticello tool based on polymorph used to browse diffs.
Activate me with the setting named 'Use Polymorph difference tools'.
"
Class {
	#name : #PSMCPatchMorph,
	#superclass : #DiffChangeMorph,
	#instVars : [
		'changeTree',
		'selectedChangeWrapper'
	],
	#classVars : [
		'UsedByDefault'
	],
	#category : #Tool-Diff,
	#timestamp : 'LaurentLaffont 2/23/2011 20:21'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph class>>defaultDiffToolsSettingOn: aBuilder [
	<systemsettings>  
	(aBuilder setting: #polymorphDiffToolsUsedByDefault)
		label: 'Use Polymorph difference tools';
		description: 'When enabled the Polymorph diff tools will be used with Monticello. When disabled, the original tools are used.';
		parent: #differator;
		target: PSMCPatchMorph;
		selector: #usedByDefault
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph class>>forPatch: aPatch [
	"Answer a new instance of the receiver
	with the given patch as the model."
	
	^ self new model: aPatch operations
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^#smallForwardIcon
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph class>>usedByDefault [
	"Answer whether the Polymorph diff tools should be used with Monticello."

	^UsedByDefault ifNil: [UsedByDefault := true]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph class>>usedByDefault: aBoolean [
	"Specify whether the Polymorph diff tools should be used with Monticello."
	
	UsedByDefault := aBoolean
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>browseClass [
	"Browse the class of the selected item."

	^ Smalltalk tools browser
		openOnClass: self selectedChangeWrapper actualClass
		selector: self selectedMessageName
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>browseImplementors [
	"Browse the method implementors."

	self systemNavigation
		browseAllImplementorsOf: (self selectedMessageName ifNil: [^self])
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>browseSenders [
	"Browse the method senders."

	self systemNavigation
		browseAllSendersOf: (self selectedMessageName ifNil: [^self])
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>browseVersions [
	"Browse the method versions."

	Smalltalk tools versionBrowser 
			browseVersionsForClass: self selectedChangeWrapper actualClass 
			selector: self selectedMessageName
			
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>buildUI [
	|descriptionHeight|
	self
		diffMorph: self newDiffMorph;
		changeTree: self newChangeTreeMorph;
		descriptionMorph: self newDescriptionMorph.
	descriptionHeight := self descriptionMorph minExtent y.
	self
		changeProportionalLayout;
		addMorph: self descriptionMorph
		fullFrame: ((0@0 corner: 1@0) asLayoutFrame leftOffset: ProportionalSplitterMorph splitterWidth; bottomOffset: descriptionHeight);
		addMorph: self changeTree
		fullFrame: ((0@0 corner: 0.3@1) asLayoutFrame topLeftOffset: ProportionalSplitterMorph splitterWidth @ descriptionHeight);
		addMorph: self diffMorph
		fullFrame: ((0.3@0 corner: 1@1) asLayoutFrame topLeftOffset: ProportionalSplitterMorph splitterWidth @ descriptionHeight);
		addPaneSplitters.
	self updateDescriptionFillStyle: self paneColor.
	self onAnnouncement: MorphOpened do: [ self expandChangeTree ]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>changeTree [
	"Answer the value of changeTree"

	^ changeTree
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>changeTree: anObject [
	"Set the value of changeTree"

	changeTree := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>changeTreeKey: aCharacter [
	"Handle change tree key strokes."

	(aCharacter == $b and: [self selectionHasActualClass]) ifTrue: [
		^self browseClass].
	(aCharacter == $v and: [self selectionIsMethodChange]) ifTrue: [
		^self browseVersions].
	(aCharacter == $m and: [self selectionIsMethodChange]) ifTrue: [
		^self browseImplementors].
	(aCharacter == $n and: [self selectionIsMethodChange]) ifTrue: [
		^self browseSenders]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>changes [
	"Answer the changes tree roots."
	
	^ PSMCChangesGrouper group: self model
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>changesMenu: m [
	"Answer the changes menu."

	| menu |
	menu := self newMenu
		addTitle: 'Changes'
		icon: (self iconNamed: #smallCopyIcon).
	menu
		addToggle: 'Browse class...' translated
		target: self
		selector: #browseClass
		getStateSelector: nil
		enablementSelector: #selectionHasActualClass.
	menu lastItem
		font: self theme menuFont;
		icon: Smalltalk tools browser taskbarIcon;
		keyText: 'Cmd+b'.
	menu addLine.
	menu
		addToggle: 'Versions...' translated
		target: self
		selector: #browseVersions
		getStateSelector: nil
		enablementSelector: #selectionIsMethodChange.
	menu lastItem
		font: self theme menuFont;
		icon: (self iconNamed: #smallJustifiedIcon);
		keyText: 'Cmd+v'.
	menu
		addToggle: 'Senders...' translated
		target: self
		selector: #browseSenders
		getStateSelector: nil
		enablementSelector: #selectionIsMethodChange.
	menu lastItem
		font: self theme menuFont;
		icon: (self iconNamed: #smallForwardIcon);
		keyText: 'Cmd+n'.
	menu
		addToggle: 'Implementors...' translated
		target: self
		selector: #browseImplementors
		getStateSelector: nil
		enablementSelector: #selectionIsMethodChange.
	menu lastItem
		font: self theme menuFont;
		icon: (self iconNamed: #smallDoItIcon);
		keyText: 'Cmd+m'.
	menu
		addToggle: 'Install incoming version' translated
		target: self
		selector: #loadMethodSelection
		getStateSelector: nil
		enablementSelector: #selectionIsMethodChange.
	menu lastItem
		font: self theme menuFont;
		icon: (self iconNamed: #smallUpdateIcon).
	menu
		addToggle: 'Revert change' translated
		target: self
		selector: #revertSelectedChange
		getStateSelector: nil.
	menu lastItem
		font: self theme menuFont;
		icon: (self iconNamed: #smallCancelIcon).
	menu
		add: 'Expand All' translated
		target: self model
		selector: #expandAll.
	menu
		add: 'Collapse All' translated
		target: self model
		selector: #collapseAll.
	^ menu
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>compositeText [
	"Answer the composite text based on the selection state
	of the joins."

	^self diffMorph compositeText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>defaultTitle [
	"Answer the default title label for the receiver."

	^'Changes' translated
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>expandChangeTree [
	self flag: #TODO. "We should only expand the nodes wich have partial changes, if a class was added or removed there is no need to show the complete tree expanded"
	self changeTree expandAll.
]

{
	#category : #menus,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>loadMethodSelection [
	"Install the selected change"
	
	self selectedChange ifNil: [ ^self ].
	self selectedChange definition load.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>model [

	^ super model ifNil: [ #() ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>model: aCollection [
	"Set the model and update the window."

	super model: aCollection.
	self changed: #changes
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>newChangeTreeMorph [
	"Answer a new morph for the tree of changes."

	^(self
		newTreeFor: self
		list: #changes
		selected: #selectedChangeWrapper
		changeSelected: #selectedChangeWrapper:)
		getMenuSelector: #changesMenu:;
		keystrokeActionSelector: #changeTreeKey:
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>removeSelection [
	"unselect current selection"
	self selectedChangeWrapper: nil.
	self changed: #changes.
	self updateSource
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>revertChange: aChange [
	"Revert the change"

	| loader |
	loader := MCPackageLoader new.
	aChange inverse applyTo: loader.
	loader loadWithName: ChangeSet current name
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>revertSelectedChange [
	"Revert the selected change"
	| change |
	change := self selectedChange.
	change ifNil: [ ^ self ].
	self revertChange: change.
	self model remove: change.
	self removeSelection.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>selectedChange [
	"Answer the selected change."

	^(self selectedChangeWrapper ifNil: [^nil]) operation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>selectedChangeWrapper [
	"Answer the selected change."

	^selectedChangeWrapper
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>selectedChangeWrapper: aWrapper [
	"Set the selected change."

	selectedChangeWrapper := aWrapper.
	self
		changed: #selectedChangeWrapper;
		updateSource;
		changed: #compositeText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>selectedMessageName [
	"Answer the method selector or nil if no method change
	is selected.."

	^self selectionIsMethodChange
		ifTrue: [self selectedChange definition selector]
		
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>selectionHasActualClass [
	"Answer whether the currently selected change has an actual
	class in the image."

	^self selectedChangeWrapper
		ifNil: [false]
		ifNotNil: [:w | w actualClass notNil]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>selectionIsMethodChange [
	"Answer whether the currently selected change is for a method."

	^self selectedChange notNil and: [ 
		self selectedChange definition isMethodDefinition and: [ 
			self selectedChange definition isLoadable ] ]
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>update: aspect [
	"A join has probably changed its selection state."

	super update: aspect.
	aspect == #selectedDifferences
		ifTrue: [self changed: #compositeText]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCPatchMorph>>updateSource [
	"Update the source difference morph."

	|sel|
	sel := self selectedChange.
	sel isNil
		ifTrue: [self diffMorph
				from: ''
				to: '']
		ifFalse: [self diffMorph
					from: sel diffFromSource
					to: sel diffToSource
					contextClass: (sel isClassPatch ifTrue: [nil] ifFalse: [sel targetClass])]
]
