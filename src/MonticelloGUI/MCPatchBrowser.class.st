"
The Monticello patch browser
"
Class {
	#name : #MCPatchBrowser,
	#superclass : #MCCodeTool,
	#instVars : [
		'selection'
	],
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:52'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser class>>forPatch: aPatch [
	^ self new patch: aPatch
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>buttonSpecs [
	^ #((Invert invert 'Show the reverse set of changes')
		 (Export export 'Export the changes as a change set'))
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>changeSetNameForInstall [
	"Answer the name of the change set into which my selection will be installed.
	Derive this from my label.
	If I have no label, use the current change set."

	| tokens |
	label ifNil: [ ^ChangeSet current name ].
	tokens := label findTokens: ' '.
	tokens removeAllFoundIn: { 'changes'. 'between'. 'and' }.
	(tokens size = 3 and: [ tokens second = '<working' ]) ifTrue: [ ^tokens first, '-to-working' ].
	tokens size = 2 ifFalse: [ ^'InstalledPatches' ].
	^'{1}-to-{2}' format: tokens 
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>defaultLabel [
	^ 'Patch Browser'
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>installSelection [
	| loader |
	selection ifNotNil:
		[loader := MCPackageLoader new.
		selection applyTo: loader.
		loader loadWithName: self changeSetNameForInstall ]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>invert [
	items := items collect: [:ea | ea inverse].
	self changed: #list; changed: #text; changed: #selection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>items [
	^ items
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>list [
	^ self items collect: [:ea | ea summary]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>patch: aPatch [
	items := aPatch operations asSortedCollection
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>revertSelection [
	| loader |
	selection ifNotNil:
		[loader := MCPackageLoader new.
		selection inverse applyTo: loader.
		loader loadWithName: self changeSetNameForInstall ]
]

{
	#category : #subclassresponsibility,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>selectedClass [
	| definition |
	selection ifNil: [ ^ nil ].
	(definition := selection definition) ifNil: [ ^ nil ].
	definition isMethodDefinition
		ifFalse: [ ^ nil ].
	^ Smalltalk globals at: definition className ifAbsent: [  ]
]

{
	#category : #subclassresponsibility,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>selectedClassOrMetaClass [
	| definition |
	selection ifNil: [ ^nil ].
	(definition := selection definition) ifNil: [ ^nil ].
	definition isMethodDefinition ifFalse: [ ^nil ].
	^definition actualClass
]

{
	#category : #subclassresponsibility,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>selectedMessageCategoryName [
	| definition |
	selection ifNil: [ ^nil ].
	(definition := selection definition) ifNil: [ ^nil ].
	definition isMethodDefinition ifFalse: [ ^nil ].
	^definition category
]

{
	#category : #subclassresponsibility,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>selectedMessageName [
	| definition |
	selection ifNil: [ ^nil ].
	(definition := selection definition) ifNil: [ ^nil ].
	definition isMethodDefinition ifFalse: [ ^nil ].
	^definition  selector
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>selection [
	^ selection 
		ifNil: [0]
		ifNotNil: [self items indexOf: selection]
]

{
	#category : #selecting,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>selection: aNumber [
	selection := aNumber = 0 ifFalse: [self items at: aNumber].
	self changed: #selection; changed: #text.
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>text [
	^ selection ifNil: [''] ifNotNil: [selection source]
]

{
	#category : #text,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>text: aTextOrString [
	self changed: #text
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCPatchBrowser>>widgetSpecs [
	 ^#(
		((listMorph:selection:menu:keystroke: list selection methodListMenu: methodListKey:from:) (0 0 1 0.4) (0 0 0 0))
		((textMorph: text) (0 0.4 1 1))
		) 

	
]
