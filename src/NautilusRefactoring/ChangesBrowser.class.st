"
A ChangesBrowser is a browser used to browse a composite change wich gather all the wanted changes
"
Class {
	#name : #ChangesBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'textArea',
		'scopeChooser',
		'changesTree',
		'changes'
	],
	#category : #NautilusRefactoring-Utilities,
	#timestamp : '<historical>'
}

{
	#category : #shortcuts,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser class>>buildShortcutsOn: aBuilder [
	<keymap>

	(aBuilder shortcut: #close)
		category: #ChangesBrowserGlobalShortcuts
		default: PharoShortcuts current cancelShortcut
		do: [ :target | target cancel ]
		description: 'Close this dialog'.
		
	(aBuilder shortcut: #accept)
		category: #ChangesBrowserGlobalShortcuts
		default: PharoShortcuts current acceptShortcut
		do: [ :target | target accept ]
		description: 'Accept the proposed changes'.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser class>>changes: aCollection [

	^ self new
		changes: aCollection;
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser class>>defaultSpec [
	<spec>
	^ SpecLayout composed
		newColumn: [ :column1 | 
			column1
				newColumn: [ :column2 | column2 add: #changesTree ];
				addSplitter;
				add: #textArea ]
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser class>>title [

	^ 'Changes Browser'
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>accept [
	self okToChange
		ifFalse: [ ^ self ].
	[ self pickedChanges do: [ :change | RBRefactoryChangeManager instance performChange: change ] ] asJob
		title: 'Refactoring';
		run.
	window value delete
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>buildDiffFor: aChange [

	^ aChange
		ifNil: [ '' ]
		ifNotNil: [
			TextDiffBuilder 
				buildDisplayPatchFrom: aChange oldVersionTextToDisplay 
				to: aChange textToDisplay ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>cancel [
	window value delete
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>changes [
	^ changes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>changes: aCollection [
	changes := aCollection.
	self updateChanges
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>changesTree [
	^ changesTree
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>initializeChangesTree [
	changesTree
		beCheckList;
		removeOnlyLastSelected: true;
		autoMultiSelection: true;
		rootNodeHolder: [ :item | 
					TreeNodeModel new
						content: item;
						hasContentToShow: true;
						children: [ changesTree childrenFor: item ] ];
		displayBlock: [ :item | item nameToDisplay ].
	self whenBuiltDo: [ changesTree selectAll ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>initializePresenter [
	changesTree whenHighlightedItemChanged: [ :item | item ifNotNil: [ textArea text: (self buildDiffFor: item content) ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>initializeTextArea [
	textArea 
		enabled: false;
		"make sure we can cycle over the text field"
		bindKeyCombination: Character tab toAction: [ self giveFocusToNextFrom: textArea ];
		bindKeyCombination: Character tab shift toAction: [ self giveFocusToPreviousFrom: textArea ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>initializeWidgets [

	changesTree := self newTree.
	textArea := self newCode.
	
	self initializeChangesTree.
	self initializeTextArea.
	self setFocus.
	self
		bindKeyCombination: PharoShortcuts current acceptShortcut toAction: [ self accept ];
		bindKeyCombination: Character escape toAction: [ self cancel ]
]

{
	#category : #opening,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>open [
	^ self openDialogWithSpec
		okAction: [ self accept ];
		cancelAction: [ self cancel ];
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>pickedChanges [
	| selectedItems |
	selectedItems := changesTree selectedItems collect: #content.
	^ changesTree roots select: [ :i | selectedItems includes: i ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>scopeChooser [
	^ scopeChooser
		ifNil: [ 
			scopeChooser := self instantiate: EnvironmentChooser.
			scopeChooser
				whenEnvironmentChanged: [ self updateChanges ];
				label: 'Scope:'.
			scopeChooser ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>setFocus [
	self focusOrder
		add: changesTree;
		add: textArea;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>setShortcuts [
	self changesTree attachKeymapCategory: #ChangesBrowserGlobalShortcuts targetting: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>textArea [
	^ textArea
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
ChangesBrowser>>updateChanges [
	| aCompositeChange |
	aCompositeChange := RBRefactoryChangeManager changeFactory
		compositeRefactoryChange.
	changes do: [ :each | aCompositeChange addChange: each ].

	self flag: 'todo'.	"Filter the shown changes depending on the selected scope"

	changesTree roots: (aCompositeChange whatToDisplayIn: self)
]
